class NotesController < ApplicationController
  before_filter :protect_catalog
  
  # GET /notes
  # GET /notes.xml
  def index
    if params[:recipient_id]
      @notes = @catalog.notes.find(:all, :conditions => ['recipient_id = ?', params[:recipient_id]])
    else
      @notes = @catalog.notes
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = @catalog.notes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = @catalog.notes.build
       
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = @catalog.notes.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  # POST /notes.pdf
  def create
    @note = @catalog.notes.build(params[:note])
    if (params[:recipient_id])
      @recipient = Recipient.find(params[:recipient_id])
    else
      @recipient = Recipient.new
      @recipient.first_name = "Temp"
      @recipient.last_name = "User"
    end
    
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

  # POST /notes/1/createpdf
  def generate_pdf
    # check if we've authenticated for real yet
    if !anyone_signed_in?
      session[:note] = params[:id]
      logger.debug "session[note]=#{session[:note]}"
      deny_access
    else
      # if we have someone logged in, then let's find their note and generate a PDF for it
      @note = @catalog.notes.find(params[:id])
    
      # update the document_content so we can regenerate the PDF
      @note.document_content = render_to_string(:action=>'show.pdf',:format=>:pdf, :layout=> false)
    
      # on save, the PDF is generated and saved to S3
      respond_to do |format|
        if @note.save 
          format.html { render :action => "success" }
          format.xml  { render :xml => @note, :status => :created, :location => @note }
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
    if @note.status == 0
      @note.destroy
      notice = 'Your note has been succesfully deleted.'
    else
      notice = 'Once notes have been sent to printing they cannot be deleted.'
    end
    
    respond_to do |format|
      format.html { redirect_to(catalogs_path, :notice => notice) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  def protect_catalog
    @catalog = current_user.catalog
    @title = controller_name
  end
  

end
