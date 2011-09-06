class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def paginate(arg, options = {})
    if arg.instance_of?(Symbol) or arg.instance_of?(String)
      #use default paginate function
      collection_id = arg
      super(collection_id, options)
    else
      items = arg
      items_per_page = options[:per_page] || 10 
      page = (params[:page] || 1).to_i
      result_pages = Paginator.new(self, items.length, items_per_page, page)
      offset = (page - 1) * items_per_page
      [result_pages, items[offset..(offset+items_per_page-1)]]
    end
    
  end
    
end
