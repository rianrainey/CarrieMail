class NotesController < ApplicationController
  before_filter :authenticate_user!, :protect_catalog

  
  # GET /notes
  # GET /notes.xml
  def index
    if params[:recipient]
      @notes = @catalog.notes.find(:all, :conditions => ['note.recipient_id = ?', params[:recipient]])
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
      format.pdf  { 
          # generate the HTML that we will conver to PDF with DocRaptor
          @note.document_content ||= render_to_string(:action=>'show.pdf', :format=>:pdf, :layout => false)
          if @note.save
            render :action => "show", :format => :html, :notice => 'Your document was sent successfully!'
          else
            render :action => "show", :format => :pdf, :notice => 'Please try again.  There was an unexpected error'
          end
        }
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
    
    # on save, the PDF is generated and saved to S3
    respond_to do |format|
      if @note.save 
        format.html { redirect_to([@catalog, @note], :notice => 'Note was successfully created.') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /notes/1/createpdf
  def generate_pdf
    @note = @catalog.notes.find(params[:id])
    logger.debug @note.to_json
    @note.document_content = render_to_string(:action=>'show.pdf',:format=>:pdf, :layout=> false)
    logger.debug "document_content = "+@note.document_content

    # on save, the PDF is generated and saved to S3
    respond_to do |format|
      if @note.save 
        format.html { redirect_to([@catalog, @note], :notice => 'Your PDF was successfully generated!') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
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
        format.html { redirect_to([@catalog, @note], :notice => 'Note was successfully updated.') }
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
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(catalog_notes_path(@catalog)) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  def protect_catalog
    @catalog = current_user.catalog || Catalog.new # Catalog.find(params[:catalog_id]);
  end

end
