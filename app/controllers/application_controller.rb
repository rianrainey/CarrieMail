class ApplicationController < ActionController::Base
  protect_from_forgery

  def deny_access
    # such a kludge
    # save the note ID in a local variable & put it back in the session after we log out
    noteid = session[:note]
    sign_out if !current_user.nil?
    
    # once we sign out, the session is cleared
    store_location
    session[:note] = noteid
    redirect_to new_user_registration_path
  end

  def anyone_signed_in?
    @guest = guest_user
    
    !current_user.nil? && (current_user != @guest)
  end

  private

    def store_location
      logger.debug "ahlp: request.fullpath = #{request.fullpath}"
      session[:return_to] = request.fullpath
    end

    def clear_stored_location
      session[:return_to] = nil
    end

  
end
