class RecipientsController < ApplicationController
  before_filter :authenticate_user!, :protect_recipient

  # GET /recipients
  # GET /recipients.xml
  def index
    @recipients = @user.recipients

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipients }
    end
  end

  # GET /recipients/1
  # GET /recipients/1.xml
  def show
    @recipient = @user.recipients.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipient }
    end
  end

  # GET /recipients/new
  # GET /recipients/new.xml
  def new
    @recipient = @user.recipients.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipient }
    end
  end

  # GET /recipients/1/edit
  def edit
    @recipient = @user.recipients.find(params[:id])
  end

  # POST /recipients
  # POST /recipients.xml
  def create
    @recipient = @user.recipients.build(params[:recipient])

    respond_to do |format|
      if @recipient.save
        format.html { redirect_to([@user, @recipient], :notice => 'Recipient was successfully created.') }
        format.xml  { render :xml => @recipient, :status => :created, :location => @recipient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipients/1
  # PUT /recipients/1.xml
  def update
    @recipient = @user.recipients.find(params[:id])

    respond_to do |format|
      if @recipient.update_attributes(params[:recipient])
        format.html { redirect_to([@user, @recipient], :notice => 'Recipient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipients/1
  # DELETE /recipients/1.xml
  def destroy
    @recipient = @user.recipients.find(params[:id])
    @recipient.destroy

    respond_to do |format|
      format.html { redirect_to(user_recipients_path(@user)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def protect_recipient
    @user = current_user
  end  
end
