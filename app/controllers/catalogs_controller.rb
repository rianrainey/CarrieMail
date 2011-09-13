class CatalogsController < ApplicationController
  before_filter :authenticate_user!, :protect_catalog
  
  def index
    @notes = @catalog.notes
    respond_to do |format|
      format.html {redirect_to catalog_notes_path(@catalog)}
    end    
  end
  
  private
  def protect_catalog
    @user = current_or_guest_user
    @catalog = @user.catalog
    @title = controller_name
  end
  
end
