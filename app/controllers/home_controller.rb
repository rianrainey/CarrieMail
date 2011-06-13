class HomeController < ApplicationController
  def index
    current_user.catalog ||= Catalog.new
    respond_to do |format| 
      format.html #index.html.erb
    end
  end

end
