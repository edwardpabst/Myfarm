class FarmsController < ApplicationController
  # GET /farms
  # GET /farms.xml
 
    before_filter :authenticate
    require "simple_time_select"

    #-------farmjob index----------------------------------------------------------------------------
        def index_view


        end

        def index_data

          get_current_user
          @farms = Farm.where('user_id' => @current_user.id).all
          #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
          #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

        end

        def index_dbaction
      		#called for all db actions
      		farmname = params["c0"]
      		total_acres	 = params["c1"]
      		land_expense_year	 = params["c2"]


      		@mode = params["!nativeeditor_status"]

      		@id = params["gr_id"]
      		case @mode

      			when "deleted"
      				@farm = Farm.find(@id)
      				@farm.destroy

      				@tid = @id
      			when "updated"
      				@farm = Farm.find(@id)
      				@farm.farmname = farmname
      				@farm.total_acres = total_acres
      				@farm.land_expense_year = land_expense_year



      				if @farm.save

      				else
        				flash[:error] = @farm.errors 
                render 'index_view' 				  
      				end

      				@tid = @id
      		end 
      	end  


    #----------- Standard ROR scaffold ----------------------------------------------
 
  def index
    get_current_user
    @farms = Farm.where('user_id' => @current_user.id).all
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @farms }
    end
  end

  # GET /farms/1
  # GET /farms/1.xml
  def show
    @farm = Farm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @farm }
    end
  end

  # GET /farms/new
  # GET /farms/new.xml
  def new
    @farm = Farm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farm }
    end
  end

  # GET /farms/1/edit
  def edit
    @farm = Farm.find(params[:id])
    session[:s_farm_id] = @farm.id
  end

  # POST /farms
  # POST /farms.xml
  def create
    @farm = Farm.new(params[:farm])
    @farm.user_id = session[:s_user_id]

    respond_to do |format|
      if @farm.save
        flash[:notice] = 'Farm was successfully created. You can now add and manage expenses.'
        format.html { redirect_to(:controller => :farms, :action => :edit, :id => @farm.id, 	:notice => 'Farm was successfully created. You can now add supplies, labor and equipment.') }
        format.xml  { render :xml => @farm, :status => :created, :location => @farm }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @farm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farms/1
  # PUT /farms/1.xml
  def update
    @farm = Farm.find(params[:id])

    respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to("/farmview", :notice => 'Farm was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @farm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.xml
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy

    respond_to do |format|
      format.html { redirect_to(farms_url) }
      format.xml  { head :ok }
    end
  end
end
