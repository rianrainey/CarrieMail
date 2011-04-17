class HomeController < ApplicationController
  def index
    @user = current_user || User.new
    if user_signed_in?
      @catalog = Catalog.new()
      redirect_to catalog_notes_path(@catalog)
    else
      redirect_to new_user_session_path
    end
  end

end
