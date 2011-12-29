class ScaleticketsController < ApplicationController
  # GET /scaletickets
  # GET /scaletickets.xml
  
  before_filter :authenticate


  #-------scaleticket index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
         @scaletickets = Scaleticket.find_by_sql("Select scaletickets.id, ticket_id, tran_date, cropplanfull, pack_qty, weight_uom, gross_weight, tare_weight, net_weight, storages.name as storagename, moisture_pct 
        from scaletickets  
        join cropplans on scaletickets.cropplan_id = cropplans.id
        join storages on scaletickets.storage_id = storages.id
        where scaletickets.user_id = #{@current_user.id } ")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		tran_date = params["c0"]
    		cropplanfull	 = params["c1"]
    		pack_qty    	 = params["c2"]   
    		weight_uom	= params["c3"]
    		gross_weight = params["c4"]
    		tare_weight = params["c5"]
    		net_weight = params["c6"]
    		storagename = params["c7"]
    		moisture_pct = params["c8"]

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    			  @inventorylot = Inventorylot.find_by_scaleticket_id(@id)
    			  if @inventorylot.qty_out_ship > 0 || @inventorylot.qty_out_transfer > 0
    			    flash[:error] = "this scale ticket can not be deleted because it has inventory activity. "
              render 'index_view'
    			  else
      				@scaleticket = Scaleticket.find(@id)
      				@scaleticket.destroy
      				@inventorylot.destroy
            
      				@tid = @id
  				  end
    			when "updated"
    				@scaleticket = Scaleticket.find(@id)
    				@scaleticket.tran_date = tran_date 
    				@scaleticket.pack_qty = pack_qty
    				@scaleticket.gross_weight = gross_weight
    				@scaleticket.tare_weight = tare_weight
    				@scaleticket.net_weight = net_weight
    				@scaleticket.moisture_pct = moisture_pct

    	


    				if @scaleticket.save

    				else
      				flash[:error] = @scaleticket.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ----------------------------------------------------------------
  def index
    @scaletickets = Scaleticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scaletickets }
    end
  end

  # GET /scaletickets/1
  # GET /scaletickets/1.xml
  def show
    @scaleticket = Scaleticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scaleticket }
    end
  end

  # GET /scaletickets/new
  # GET /scaletickets/new.xml
  def new
    @scaleticket = Scaleticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scaleticket }
    end
  end

  # GET /scaletickets/1/edit
  def edit
    @scaleticket = Scaleticket.find(params[:id])
  end

  # POST /scaletickets
  # POST /scaletickets.xml
  def create
    @scaleticket = Scaleticket.new(params[:scaleticket])
    @scaleticket.user_id = session[:s_user_id]
    @typeprefix = Type.find_by_typename("scaleticket_prefix")
    @typenumber = Type.find_by_typename("scaleticket_number")
    
    @scaleticket.ticket_id = (@typeprefix.type_value_string + @typenumber.type_value_integer.to_s)
      
    @typenumber.type_value_integer += 4
    @typenumber.save
    
    respond_to do |format|
      if @scaleticket.save
       #---- create inventory record for scaleticket ------------------- 
        @inventorylot = Inventorylot.new
        @inventorylot.user_id = @scaleticket.user_id
        @inventorylot.scaleticket_id = @scaleticket.id
        @inventorylot.storage_id = @scaleticket.storage_id
        @inventorylot.cropplan_id = @scaleticket.cropplan_id
        @inventorylot.qty_in = @scaleticket.net_weight
        @inventorylot.qty_onhand = @scaleticket.net_weight
        @inventorylot.qty_out_ship = 0
        @inventorylot.qty_out_transfer = 0
        @inventorylot.transfer_amount = 0
        @inventorylot.inventory_uom = @scaleticket.weight_uom
        @inventorylot.grade =  ""
        @inventorylot.lab_report = ""
        
        if @inventorylot.save
          format.html { redirect_to("/scaleticketview", :notice => 'Scaleticket was successfully created.') }
          format.xml  { render :xml => @scaleticket, :status => :created, :location => @scaleticket }
        else
          format.html { redirect_to("/scaleticketview", :notice => 'Scaleticket was successfully created but Inventory record was not.') }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scaleticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scaletickets/1
  # PUT /scaletickets/1.xml
  def update
    @scaleticket = Scaleticket.find(params[:id])
  
     
    respond_to do |format|
      if @scaleticket.update_attributes(params[:scaleticket])
        
        #---- update inventory record for scaleticket ------------------- 
         @inventorylot = Inventorylot.find_by_scaleticket_id(@scaleticket.id)
         if !@inventorylot.nil?
           @inventorylot.qty_in = @scaleticket.net_weight
           @inventorylot.qty_onhand = @scaleticket.net_weight
           @inventorylot.qty_out_ship = 0
           @inventorylot.qty_out_transfer = 0
           @inventorylot.transfer_amount = 0
           @inventorylot.inventory_uom = @scaleticket.weight_uom
           @inventorylot.save
         end
        format.html { redirect_to("/scaleticketview", :notice => 'Scaleticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scaleticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scaletickets/1
  # DELETE /scaletickets/1.xml
  def destroy
    @scaleticket = Scaleticket.find(params[:id])
    @scaleticket.destroy

    respond_to do |format|
      format.html { redirect_to(scaletickets_url) }
      format.xml  { head :ok }
    end
  end
  

end

