class SuppliesController < ApplicationController
  # GET /supplies
  # GET /supplies.xml
  
  before_filter :authenticate

  #-------supplies index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
        @supplies = Supply.where('user_id' => @current_user.id).order('supply_type').all

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		supplyname = params["c0"]
    		supply_type	 = params["c1"]
    		item_number	= params["c2"]
    		manufacturer = params["c3"]
    		supply_uom = params["c4"]
    		supply_cost_uom = params["c5"]
    		distribution_uom = params["c6"]
    		conversion_factor = params["c7"]

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@supply = Supply.find(@id)
    				@supply.destroy

    				@tid = @id
    			when "updated"
    				@supply = Supply.find(@id)
    				@supply.supplyname = supplyname 
    				@supply.supply_type = supply_type
    				@supply.item_number = item_number
    				@supply.manufacturer = manufacturer
    				@supply.supply_uom = supply_uom
    				@supply.supply_cost_uom = supply_cost_uom
    				@supply.distribution_uom = distribution_uom
    				@supply.conversion_factor = conversion_factor
    	


    				if @supply.save

    				else
      				flash[:error] = @supply.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ---------------------------------------------------------------- 
  def index
    get_current_user
    @supplies = Supply.where('user_id' => @current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supplies }
    end
  end

  # GET /supplies/1
  # GET /supplies/1.xml
  def show
    @supply = Supply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supply }
    end
  end

  # GET /supplies/new
  # GET /supplies/new.xml
  def new
    @supply = Supply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supply }
    end
  end

  # GET /supplies/1/edit
  def edit
    @supply = Supply.find(params[:id])
  end

  # POST /supplies
  # POST /supplies.xml
  def create
    @supply = Supply.new(params[:supply])
    @supply.user_id = session[:s_user_id]
    respond_to do |format|
      if @supply.save
        format.html { redirect_to("/supplyview", :notice => 'Supply was successfully created.') }
        format.xml  { render :xml => @supply, :status => :created, :location => @supply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supplies/1
  # PUT /supplies/1.xml
  def update
    @supply = Supply.find(params[:id])

    respond_to do |format|
      if @supply.update_attributes(params[:supply])
        format.html { redirect_to("/supplyview", :notice => 'Supply was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.xml
  def destroy
    @supply = Supply.find(params[:id])
    @supply.destroy

    respond_to do |format|
      format.html { redirect_to(supplies_url) }
      format.xml  { head :ok }
    end
  end
end
