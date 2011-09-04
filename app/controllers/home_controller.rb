class HomeController < ApplicationController
  def index
    @guest = User.find_by_first_name("guest")
    if @guest.nil?
        @guest = User.create(:first_name=>'guest', :last_name=>'guest', :email=>'guest@carriemail.com', :password=>'guest')
    end
    sign_in(:user, @guest)
    
    
    @title = controller_name
    @catalog = current_user.catalog
    respond_to do |format| 
      format.html #index.html.erb
    end
  end

end
