class FieldmappingsController < ApplicationController
  # GET /fieldmappings
  # GET /fieldmappings.xml
  def fieldmapping
    @onload = "initmap()"
    @fieldmapping = Field.find(session[:s_field_id])
    respond_to do |format|
      format.html # fieldmapping.html.erb
      format.xml  { render :xml => @fieldmappings }
    end
  end
  
  def fieldmapping_area
   
    @fieldmapping = Field.find(session[:s_field_id])
    @fieldmappings =  Fieldmapping.get_fieldmapping_by_field(session[:s_field_id])
    if !@fieldmappings.nil? and !@fieldmappings.empty?
      @newcoordinates1 = ""
      @fieldmappings.each do  |fm|
        @newcoordinates1 += (fm.latitude.to_s  + ',')
        fm.longitude.slice!(0)
        @newcoordinates1 += (fm.longitude.to_s + ',') 
      end  
      logger.debug "FIELD MAPPINGS NEW COORDINATE 1 #{@newcoordinates1}"  
      length = @newcoordinates1.length
      @newcoordinates1.slice!(length -1)
       logger.debug "FIELD MAPPINGS NEW COORDINATE 2 #{@newcoordinates1}" 
    end
    respond_to do |format|
      format.html # fieldmapping.html.erb
      format.xml  { render :xml => @fieldmappings }
    end
  end
  
  def index
    @fieldmappings = Fieldmapping.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fieldmappings }
    end
  end

  # GET /fieldmappings/1
  # GET /fieldmappings/1.xml
  def show
    @fieldmapping = Fieldmapping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fieldmapping }
    end
  end

  # GET /fieldmappings/new
  # GET /fieldmappings/new.xml
  def new
    @fieldmapping = Fieldmapping.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fieldmapping }
    end
  end

  # GET /fieldmappings/1/edit
  def edit
    @fieldmapping = Fieldmapping.find(params[:id])
  end

  # POST /fieldmappings
  # POST /fieldmappings.xml
  def create
    @fieldmapping = Fieldmapping.new(params[:fieldmapping])

    respond_to do |format|
      if @fieldmapping.save
        format.html { redirect_to(@fieldmapping, :notice => 'Fieldmapping was successfully created.') }
        format.xml  { render :xml => @fieldmapping, :status => :created, :location => @fieldmapping }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fieldmapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fieldmappings/1
  # PUT /fieldmappings/1.xml
  def update
    @fieldmapping = Fieldmapping.find(params[:id])

    respond_to do |format|
      if @fieldmapping.update_attributes(params[:fieldmapping])
        format.html { redirect_to(@fieldmapping, :notice => 'Fieldmapping was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fieldmapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fieldmappings/1
  # DELETE /fieldmappings/1.xml
  def destroy
    @fieldmapping = Fieldmapping.find(params[:id])
    @fieldmapping.destroy

    respond_to do |format|
      format.html { redirect_to(fieldmappings_url) }
      format.xml  { head :ok }
    end
  end
end
