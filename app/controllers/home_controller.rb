class HomeController < ApplicationController
  def index
    # always log in the guest user first, unless we're already logged in
    #if current_user.nil? 
      # guest user is seeded in the database, always
    #  sign_in(:user, User.find_by_email("guest@carriemail.com"))
    #end # current_user.nil?
  
    @title = controller_name
    @user = current_or_guest_user
    @catalog = current_or_guest_user.catalog
    respond_to do |format| 
      format.html # by convention this renders index.html.erb
    end #respond_to
  end #index
end #HomeController
