class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :protect_catalog 

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      current_or_guest_user.carts << @current_cart
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if !session[:guest_user_id].nil?
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end
  
  # find guest_user object associated with the current session, 
  # creating one as needed
  def guest_user
    guest_user_id = (session[:guest_user_id] ||= create_guest_user.id)
    User.find(guest_user_id)
  end
  
  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    current_user.catalog.notes << guest_user.catalog.notes
    current_user.carts << guest_user.carts
  end

  def deny_access
    # store off the place we were going to go after re-direction from logging in 
    store_location
    authenticate_user!
  end

  def anyone_signed_in?
    @guest = guest_user.id
    !current_user.nil? && (current_user.id != @guest)
  end

  private

    def store_location
      logger.debug "ApplicationController::store_location: request.fullpath = #{request.fullpath}"
      session[:return_to] = request.fullpath
    end

    def clear_stored_location
      session[:return_to] = nil
    end
    
    def create_guest_user
      u = User.create(:first_name => "John", :last_name => "Doe (Guest)", 
                      :email => "guest_#{Time.now.to_i}#{rand(99)}@carriemail.com")
      u.save(:validate => false)
      u
    end
    
    def protect_catalog
      @user = current_or_guest_user
      @catalog = @user.catalog
      @title = controller_name
    end
  
end
