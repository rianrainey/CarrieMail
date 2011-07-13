class CatalogsController < ApplicationController
  before_filter :authenticate_user!, :protect_catalog
  
  def index
    @notes = @catalog.notes
    respond_to do |format|
      format.html # index.html.erb (by convention)
      format.xml {render :xml => @catalog}
    end    
  end
  
  private
  def protect_catalog
    if current_user.catalog.nil?
      current_user.catalog = Catalog.create(:user_id => current_user.id)
    end
    @catalog = current_user.catalog
  end
  
end
