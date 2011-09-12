class SessionsController < Devise::SessionsController
  protected
    # Customize the Devise after_sign_in_path_for() for redirecct to previous page after login
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :user, User
      if !session[:note].nil?
        # find the note that was created by the guest user just now
        noteid = session[:note]
        logger.debug "#{Time.now}: after_sign_up_path_for: noteid=#{noteid}, session[:note]=#{session[:note]}"
      
        # and transfer it to this user
        @note = Note.find(noteid)
        resource_or_scope.catalog.notes << @note
      
        store_location = session[:return_to]
        clear_stored_location
        (store_location.nil?) ? home_path : store_location.to_s
      else
        home_path
      end
    else
      super
    end
  end

  
end