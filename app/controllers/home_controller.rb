class HomeController < ApplicationController
  
  def index
    @title = 'Home'
    @guest_user = User.find_by_first_name("guest")
    if @guest_user.nil?
      @guest_user = User.create(:first_name=>'guest',:last_name=>'guest',:email=>'guest@carriemail.com',:password=>'guest123')
    end
    
    sign_in(:user, @guest_user)
    
    respond_to do |format| 
      format.html #index.html.erb
    end
  end
  
end
