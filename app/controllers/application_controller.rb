class ApplicationController < ActionController::Base
  protect_from_forgery

  def deny_access
    # such a kludge
    # save the note ID in a local variable & put it back in the session after we log out
    noteid = session[:note]
    sign_out if !current_user.nil?
    
    # once we sign out, the session is cleared
    store_location
    
    # restore the ID of the note we were working on
    session[:note] = noteid
    redirect_to new_user_registration_path
  end

  # find guest_user object associated with the current session, 
  # creating one as needed
  def guest_user
    guest_user_id = session[:guest_user_id] ||= User.find_by_email("guest@carriemail.com").id
    User.find(guest_user_id)
  end

  def anyone_signed_in?
    !current_user.nil? && !session[:guest_user_id].nil? && (current_user.id != session[:guest_user_id])
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
