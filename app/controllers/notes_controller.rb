class NotesController < ApplicationController
  before_filter :authenticate_user!, :protect_catalog

  
  # GET /notes
  # GET /notes.xml
  def index
    @notes = @catalog.notes

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
    @note.document_content ||= render_to_string(:action=>'show.pdf.erb', :format=>:pdf, :layout => false)
    
    respond_to do |format|
      if @note.save # @catalog.notes << @note
        format.html { redirect_to([@catalog, @note], :notice => 'Note was successfully created.') }
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
    @note.document_content ||= render_to_string(:layout=>false, :format=>'pdf', :action=>'show')
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
  
  def doc_raptor_send(options = {})
    default_options = {
      :name           => 'carriemail',
      :document_type  => 'pdf',
      :test           => true,
    }
    options = default_options.merge(options) 
    options[:document_content] ||= render_to_string
    
    response = DocRaptor.create(options)
    # response.body is the pdf we created
    if response.code == 200
      send_data response, :filename => "#{options[:name]}.pdf", :type => 'pdf', :disposition => 'inline'
    else
      render :inline => response.body, :status => response.code
    end
  end
  

  
  private
  def protect_catalog
    @catalog = Catalog.find(params[:catalog_id]);
    unless @catalog.user == current_user
      flash[:notice] = "This is not your list of notes"
      redirect_to root
      return false
    end
  end

end
