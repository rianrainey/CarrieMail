class HomeController < ApplicationController
  def index
    @title = controller_name

    respond_to do |format| 
      format.html #index.html.erb
    end
  end

end
