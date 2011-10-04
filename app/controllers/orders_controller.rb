class OrdersController < ApplicationController
  before_filter :authenticate_user!, :protect_orders
  
  # GET /orders/1
  # GET /orders/1.xml
  def show
    logger.debug "OrdersController#show: putting the current_cart's order into @order"
    @order = current_cart.order

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = current_cart.build_order(params[:order])
    logger.debug "OrdersController#create: order=#{current_cart.order}"
    @order.ip_address = request.remote_ip
    @note = current_cart.notes.first
    
    respond_to do |format|
      if @order.save # if we can save the order successfully, then purchase the item
        if @order.purchase  # when we purchase it, redirect to a 'success' page
          format.html { redirect_to(generate_pdf_catalog_note_path(@catalog, @note), 
                                    :controller => :orders, 
                                    :notice => 'Success! Your letter will soon be delivered.') }
          format.xml  { render :xml => @order, :status => :created, :location => @order }
        else
          logger.debug "Orders#create: could not purchase the order - redirecting back"
          format.html { render :action => "new"}
        end
        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
  
  def protect_orders
    @title = controller_name
    @user = current_or_guest_user # logs in guest user unless we're already logged in
    @catalog = @user.catalog
    @cart = current_cart
  end
  
  
end
