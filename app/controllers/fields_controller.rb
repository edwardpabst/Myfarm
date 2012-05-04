class FieldsController < ApplicationController
  # GET /fields
  # GET /fields.xml

  
  before_filter :authenticate
  
  def index_view
      
  end
  
  def map_view
    
  end
  
  def fieldmap_utility
      
  end
  
  def index_data
    get_current_user
    @fields = Field.where('user_id' => @current_user.id).all

  end
  def index
    get_current_user
    @fields = Field.where('user_id' => @current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fields }
    end
  end
  
   def dbaction
  		#called for all db actions
  		fieldname = params["c0"]
  		farmname	 = params["c1"]
  		number_acres	= params["c2"]
  		location = params["c3"]
  		holding_status	 = params["c4"]
  		current_state	= params["c5"]
  		area_mapped = params["c6"]
  		area_legal	 = params["c7"]
  		area_tillable	= params["c8"]
 

  		@mode = params["!nativeeditor_status"]

  		@id = params["gr_id"]
  		case @mode
  			when "inserted"
  				@field = Field.new
  				@field.user_id = session[:s_user_id]
  				@field.fieldname = fieldname
  				@field.farmname = farmname
  				@field.location = location
  				@field.number_acres = number_acres
  				@field.holding_status = holding_status
  				@field.current_state = current_state
  				@field.area_mapped = area_mapped
  				@field.area_legal = area_legal
  				@field.area_tillable = area_tillable
 
  				if @field.save
 
  				else
            flash[:error] = @field.errors 
            render 'index_view'				  
  				end

  				@tid = @field.id
  			when "deleted"
  				field=Field.find(@id)
  				field.destroy

  				@tid = @id
  			when "updated"
  				@field = Field.find(@id)
  				@field.fieldname = fieldname
  				@field.farmname = farmname
  				@field.location = location
  				@field.number_acres = number_acres
  				@field.holding_status = holding_status
  				@field.current_state = current_state
  				@field.area_mapped = area_mapped
  				@field.area_legal = area_legal
  				@field.area_tillable = area_tillable
 
  				if @field.save
  				   
  				else
    				flash[:error] = @field.errors 
            render 'index_view' 				  
  				end

  				@tid = @id
  		end 
  	end

  # GET /fields/1
  # GET /fields/1.xml
  def show
    @field = Field.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @field }
    end
  end

  # GET /fields/new
  # GET /fields/new.xml
  def new
    @field = Field.new
    @ownerparties = find_parties_by_role("Landlord")
    @clientparties = find_parties_by_role("Client")
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @field }
    end
  end

  # GET /fields/1/edit
  def edit
    @ownerparties = find_parties_by_role("Landlord")
    @clientparties = find_parties_by_role("Client")
    @field = Field.find(params[:id]) 
    session[:s_field_id] = @field.id
    @json = Field.find(params[:id]).to_gmaps4rails
     logger.debug "JSON FOR GOOGLE MAP**** #{@json}" 
    
 #--------------------------------------------------------------------------------------------------
#first element of the array, describing the first polygon
#first hash here could optionally contain settings for the current polygon (which won't use defaults then)

#{
#  "lat" => 38.270871,"lng" => -122.502156,
#  "strokeColor" =>  "#FF0000",
#  "strokeOpacity" =>  0.3,
#  "strokeWeight" =>  1,
#  "fillColor" =>  "#FF0000",
#  "fillOpacity" =>  0.7
# },#other hashes simply contain longitude and latitude
#,   second polygon
#  [
#  // the first hash contains no customization so it will use default display options
#  {"lng":   0, "lat":   0},
# {"lng":  10, "lat":  10},
#  {"lng": -10, "lat": -10}
#  ]
#add as many array as you want
   
#@json_polygon =  '[ [
#          {"lat": 38.270871,"lng":  -122.502156},
#			     {"lat":  38.267401,"lng":  -122.501384},
#			     {"lat":  38.269085,"lng":  -122.490998},
#			     {"lat":  38.272084,"lng":  -122.493187},
#			     {"lat": 38.272253,"lng":  -122.495719},
#			     {"lat":  38.271983,"lng":  -122.499195}
 #                    ] ]'
 
    @fieldmapping = Fieldmapping.find_all_by_field_id(@field.id)
    if !@fieldmapping.empty?
        @json_polygon = '['
        @firsttime = true
    
        @fieldmapping.each do |fm|
          if @firsttime == true
            @json_polygon += '['
            @firsttime = false
            @shape_id = fm.shape_id
            @json_polygon += '{"lat": '
            @json_polygon += fm.latitude
            @json_polygon += ', "lng": '
            @json_polygon += fm.longitude
            @json_polygon += '}'
          else
            if fm.shape_id != @shape_id
              @json_polygon += ' ], '
              @json_polygon += ' [ '
              @shape_id = fm.shape_id
            else
               @json_polygon += ','
            end
       
            @json_polygon += '{"lat": '
            @json_polygon += fm.latitude
            @json_polygon += ', "lng": '
            @json_polygon += fm.longitude
            @json_polygon += '}'
        
           end
        
        end
        @json_polygon += ']  ]'
    else      
      @json_polygon = '[]'
         
    end
  
   #logger.debug "JSON FOR POLYGON **** #{@json_polygon}" 
  end



  # POST /fields
  # POST /fields.xml
  def create
    @field = Field.new(params[:field])
    @field.user_id = session[:s_user_id]
    if !@field.farm_id.nil?
      @farm = Farm.find(@field.farm_id)
      @field.farmname = @farm.farmname
    end
    if @field.land_expense_year.nil?
      @field.land_expense_year = 0
    end
    if @field.percent_harvest_acre.nil?
      @field.percent_harvest_acre = 0
    end
    if @field.fixed_amount_acre.nil?
      @field.fixed_amount_acre = 0
    end
  
    
    respond_to do |format|
      if @field.save
        format.html { redirect_to :action => "edit" , :id => @field.id }
        format.xml  { render :xml => "/fieldview", :status => :created, :location => @field }
      else
        @ownerparties = find_parties_by_role("Landlord")
        @clientparties = find_parties_by_role("Client")
        format.html { render :action => "new" }
        format.xml  { render :xml => @field.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fields/1
  # PUT /fields/1.xml
  def update
    
    ismapping = false
    #update for new field mapping
    if !params[:newcoordinates1].nil? and params[:newcoordinates1] != ''
      Fieldmapping.setnewmapping(session[:s_user_id], params[:id],params[:newcoordinates1],params[:newcoordinates2],params[:newcoordinates3],params[:newcoordinates4],params[:newcoordinates5],params[:newcoordinates6])
      ismapping = true
    end
    
    
    @field = Field.find(params[:id])


    respond_to do |format|
      if @field.update_attributes(params[:field])
        if ismapping == true
          format.html { redirect_to :action => "edit" , :id => session[:s_field_id]}
        else
          format.html { redirect_to("/fieldview" , :notice => 'Field was successfully updated.') }
        end
        format.xml  { render :xml => "/fieldview", :status => :created, :location => @field }
      else
        @ownerparties = find_parties_by_role("Landlord")
        @clientparties = find_parties_by_role("Client")
        format.html { render :action => "edit" }
        format.xml  { render :xml => @field.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  

  # DELETE /fields/1
  # DELETE /fields/1.xml
  def destroy
    @field = Field.find(params[:id])
    @field.destroy

    respond_to do |format|
      format.html { redirect_to(fields_url) }
      format.xml  { head :ok }
    end
  end
end
