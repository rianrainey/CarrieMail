class CatalogsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb (by convention)
      format.xml {render :xml => @catalog}
    end    
  end
  
end
