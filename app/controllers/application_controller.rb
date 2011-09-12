class ApplicationController < ActionController::Base
  protect_from_forgery
    
    # once we sign out, the session is cleared
    store_location
    session[:note] = noteid
    redirect_to new_user_registration_path
  end

  def anyone_signed_in?
    @guest = guest_user
    
end
