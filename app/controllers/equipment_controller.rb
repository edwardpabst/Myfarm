class EquipmentController < ApplicationController
  # GET /equipment
  # GET /equipment.xml
  before_filter :authenticate

  #-------supplies index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
        @equipments = Equipment.where('user_id' => @current_user.id).all

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		description = params["c0"]
    		category	 = params["c1"]
    		make	= params["c2"]
    		model = params["c3"]
    		year = params["c4"]
    		cost_unit = params["c5"]
    		cost_unit_hour = params["c6"]
    		rate_per_hour = params["c7"]

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@equipment = Equipment.find(@id)
    				@equipment.destroy

    				@tid = @id
    			when "updated"
    				@equipment = Equipment.find(@id)
    				@equipment.description = description 
    				@equipment.category = category
    				@equipment.make = make
    				@equipment.model = model
    				@equipment.year = year
    				@equipment.cost_unit = cost_unit
    				@equipment.cost_unit_hour = cost_unit_hour
    				@equipment.rate_per_hour = rate_per_hour
    	


    				if @equipment.save

    				else
      				flash[:error] = @equipment.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ---------------------------------------------------------------- 
 
  
  
  def index
    get_current_user
   @equipment = Equipment.where('user_id' => @current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment }
    end
  end

  # GET /equipment/1
  # GET /equipment/1.xml
  def show
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment }
    end
  end

  # GET /equipment/new
  # GET /equipment/new.xml
  def new
    @equipment = Equipment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment }
    end
  end

  # GET /equipment/1/edit
  def edit
    @equipment = Equipment.find(params[:id])
  end

  # POST /equipment
  # POST /equipment.xml
  def create
    @equipment = Equipment.new(params[:equipment])
    @equipment.user_id = session[:s_user_id]
    respond_to do |format|
      if @equipment.save
        format.html { redirect_to("/equipmentview", :notice => 'Equipment was successfully created.') }
        format.xml  { render :xml => @equipment, :status => :created, :location => @equipment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment/1
  # PUT /equipment/1.xml
  def update
    @equipment = Equipment.find(params[:id])

    respond_to do |format|
      if @equipment.update_attributes(params[:equipment])
        format.html { redirect_to("/equipmentview", :notice => 'Equipment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.xml
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy

    respond_to do |format|
      format.html { redirect_to(equipment_index_url) }
      format.xml  { head :ok }
    end
  end
end
