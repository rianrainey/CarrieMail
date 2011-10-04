class HomeController < ApplicationController
  def index
    @title = controller_name
    @user = current_or_guest_user # logs in guest user unless we're already logged in
    @catalog = current_or_guest_user.catalog
    respond_to do |format| 
      format.html # by convention this renders index.html.erb
    end #respond_to
  end #index
end #HomeController
