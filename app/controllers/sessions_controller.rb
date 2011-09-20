class SessionsController < Devise::SessionsController
  protected
    # Customize the Devise after_sign_in_path_for() for redirecct to previous page after login
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :user, User
        store_location = session[:return_to]
        clear_stored_location
        (store_location.nil?) ? home_path : store_location.to_s
    else
      super
    end
  end

  
end