class NotesController < ApplicationController
  before_filter :protect_catalog
  
  # GET /notes
  # GET /notes.xml
  def index
    @notes = @user.catalog.notes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = @user.catalog.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = @user.catalog.notes.build
    @note.return_name = @user.name
    @note.return_street = @user.street  
    @note.return_city = @user.city
    @note.return_state = @user.state
    @note.return_zip = @user.zip

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = @user.catalog.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
    @note = @user.catalog.notes.build(params[:note])
    
    respond_to do |format|
      if @note.save 
        format.html { redirect_to([@catalog, @note]) }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /notes/1/createpdf
  def generate_pdf
    # check if we've authenticated for real yet
    if !anyone_signed_in?
      deny_access
    else
      # if we have someone logged in, then let's find their note and generate a PDF for it
      @note = @user.catalog.notes.find(params[:id])
    
      # update the document_content so we can regenerate the PDF
      @note.document_content = render_to_string(:action=>'standard_letter.pdf',:format=>:pdf, :layout=> false)
      
      # update the envelope content so we can generate the envelope
      @note.envelope_content = render_to_string(:action=>'standard_envelope.pdf', :format=>:pdf, :layout=>false)
    
      # capture the remote ip address of the purchaser
      buyers_ipaddr = request.remote_ip
      
      # on save, the PDF is generated and saved to S3
      respond_to do |format|
        if @note.save 
          if @note.purchase buyers_ipaddr
            format.html { redirect_to(catalog_notes_path(@catalog)) }
            format.xml  { render :xml => @note, :status => :created, :location => @note }
          else
            format.html { render :action => 'edit', :notice => 'Unable to process payment. Please try again.'}
          end          
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  
  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = @catalog.notes.find(params[:id])
    
    # on save, the PDF is generated and saved to S3
    respond_to do |format|
      if @note.update_attributes(params[:note]) 
        format.html { redirect_to([@catalog, @note]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = @catalog.notes.find(params[:id])

    # can only destroy notes that have not yet been generated
    if !@note.is_printing?
      @note.destroy
      notice = 'Your note has been succesfully deleted.'
    else
      notice = 'Once notes have been sent to printing they cannot be deleted.'
    end
    
    respond_to do |format|
      format.html { redirect_to(catalog_notes_url, :notice => notice) }
      format.xml  { head :ok }
    end
  end
  
  
  private
    def protect_catalog
      @user = current_or_guest_user
      @catalog = @user.catalog
      @title = controller_name
    end
  

end
