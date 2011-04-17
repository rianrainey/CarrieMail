class HomeController < ApplicationController
  def index
    if user_signed_in?
      current_user.catalog ||= Catalog.new()
      redirect_to catalog_notes_path(current_user.catalog)
    else
      redirect_to new_user_session_path
    end
  end

end
