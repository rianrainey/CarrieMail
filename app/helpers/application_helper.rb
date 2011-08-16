module ApplicationHelper
  
  @guest_id = 30
  
  
  # # if user is logged in, return current_user, else return guest_user
  # def current_or_guest_user
  #   if current_user
  #     if session[:guest_user_id]
  #       logging_in
  #       guest_user.destroy
  #       session[:guest_user_id] = nil
  #     end
  #     current_user
  #   else
  #     guest_user
  #   end
  # end
  # 
  # # find guest_user object associated with the current session, 
  # # creating one as needed
  # def guest_user
  #   logger.debug "creating a guest user, I think"
  #   guest_user_id = session[:guest_user_id] ||= User.create!(:first_name => "guest", :last_name => "guest", 
  #                                                           :email => "guest@carriemail.com", :password=>'guest123').id
  #   User.find(guest_user_id)
  # end
  # 
  # # called (once) when the user logs in, insert any code your application needs
  # # to hand off from guest_user to current_user.
  # def logging_in
  #   logger.debug "called by current_or_guest_user"
  # end
end
