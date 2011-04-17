class HomeController < ApplicationController
  def index
    @messages = current_user.messages
    respond_to do |format| 
      format.html #index.html.erb
    end
  end

end
