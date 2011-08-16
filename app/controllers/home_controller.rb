class HomeController < ApplicationController
  
  def index
    @title = 'Home'
    @guest_user = User.find_by_id(@guest_id)
    sign_in(:user, @guest_user)
    
    respond_to do |format| 
      format.html #index.html.erb
    end
  end
  
end
