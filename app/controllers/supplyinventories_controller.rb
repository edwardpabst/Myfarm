class SupplyinventoriesController < ApplicationController
  # GET /supplyinventories
  # GET /supplyinventories.xml
  
  before_filter :authenticate
 
 
  #-------supplies index----------------------------------------------------------------------------
      def index_view
        get_current_user
        @total_onhand_value = Supplyinventory.get_total_value(@current_user.id)

      end

      def index_data

        get_current_user
        @supplyinventories =  Supplyinventory.find_by_sql("Select supplyinventories.id, supplyinventories.created_at, 
                              supplyname, qty_onhand, supplyinventories.supply_uom, storages.name as storagename, qty_in, qty_out,
                              onhand_value, avg_cost 
        from supplyinventories 
        join supplies on supplyinventories.supply_id = supplies.id
        join storages on supplyinventories.storage_id = storages.id
        where supplyinventories.user_id = #{@current_user.id } ")


      end

      def index_dbaction
    		#called for all db actions
    		supplyname = params["c0"]
    		storagename	 = params["c1"]
    		supplu_uom	= params["c2"]
    		qty_in = params["c3"]
    		qty_out = params["c4"]
    		qty_onhand = params["c5"]
    		onhand_value = params["c6"]
    		avg_cost = params["c7"]
    	

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@supplyinventory = Supplyinventory.find(@id)
    				@supplyinventory.destroy

    				@tid = @id
    			when "updated"
    				@supplyinventory = Supplyinventory.find(@id)
    		

    				if @supplyinventory.save

    				else
      				flash[:error] = @supplyinventory.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end
#------------Standard ROR scaffold ----------------------------------------------------
  def index
    @supplyinventories = Supplyinventory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supplyinventories }
    end
  end

  # GET /supplyinventories/1
  # GET /supplyinventories/1.xml
  def show
    @supplyinventory = Supplyinventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supplyinventory }
    end
  end

  # GET /supplyinventories/new
  # GET /supplyinventories/new.xml
  def new
    @supplyinventory = Supplyinventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supplyinventory }
    end
  end

  # GET /supplyinventories/1/edit
  def edit
    @supplyinventory = Supplyinventory.find(params[:id])

    @supplyinventory_list =  Supplyinventory.find_by_sql("Select supplyinventories.id, supplyinventories.created_at, 
                          supplyname, qty_onhand, supplyinventories.supply_uom, storages.name as storagename, qty_in, qty_out,
                          onhand_value, avg_cost 
    from supplyinventories 
    join supplies on supplyinventories.supply_id = supplies.id
    join storages on supplyinventories.storage_id = storages.id
    where supplyinventories.id = #{params[:id]} limit 1")
  end

  # POST /supplyinventories
  # POST /supplyinventories.xml
  def create
    @supplyinventory = Supplyinventory.new(params[:supplyinventory])
    @supplyinventory.qty_in = 0
    @supplyinventory.qty_out = 0
    @supplyinventory.qty_onhand = 0
    @supplyinventory.onhand_value = 0
    @supplyinventory.avg_cost = 0
    @supplyinventory.user_id = @current_user.id
    

    respond_to do |format|
      if @supplyinventory.save
        format.html { redirect_to(@supplyinventory, :notice => 'Supplyinventory was successfully created.') }
        format.xml  { render :xml => @supplyinventory, :status => :created, :location => @supplyinventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supplyinventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supplyinventories/1
  # PUT /supplyinventories/1.xml
  def update
    @supplyinventory = Supplyinventory.find(params[:id])
  #logger.debug "COMPARISON PARAMS ONHAND #{params[:supplyinventory][:qty_onhand]}" 
  #logger.debug "COMPARISON INVENTORYLOT ONHAND #{@supplyinventory.qty_onhand}" 
    
      # qty edit
        parm_onhand = params[:supplyinventory][:qty_onhand].to_f 
        if parm_onhand > @supplyinventory.qty_onhand and params[:supplyinventory][:storage_id].to_i != @supplyinventory.storage_id.to_i
          #logger.debug "CONDITION 1" 
          flash[:error] = "transfer qty can not be greater than onhand qty. "
          @success = false
    
      #condition  - regrade and or transfer amount
        elsif params[:supplyinventory][:storage_id].to_i != @supplyinventory.storage_id.to_i 
          #logger.debug "CONDITION 2" 
          transfer_inventory 
             
        else
          adjust_inventory

        end
    respond_to do |format|
        if @success == true
           
            format.html { redirect_to("/supplyinventoryview", :notice => 'Inventory was successfully created.') }
        else
           
            format.html {redirect_to(:controller => :supplyinventories, :action => :edit, :id => @supplyinventory.id) }
       end
    end
  end

  # DELETE /supplyinventories/1
  # DELETE /supplyinventories/1.xml
  def destroy
    @supplyinventory = Supplyinventory.find(params[:id])
    @supplyinventory.destroy

    respond_to do |format|
      format.html { redirect_to(supplyinventories_url) }
      format.xml  { head :ok }
    end
  end
  
  def transfer_inventory
    qty_onhand =  params[:supplyinventory][:qty_onhand].to_f 
    #logger.debug "INVENTORY LOT INSPECT #{@supplyinventory.inspect}" 
    @supplyinventory.qty_onhand -=  qty_onhand  
    @supplyinventory.qty_out +=  qty_onhand 
    @supplyinventory.onhand_value =  @supplyinventory.qty_onhand * @supplyinventory.avg_cost 

    if @supplyinventory.save
      #write transaction record 
        SupplyinventoryTran.addtransaction("transfer_out", @supplyinventory.id, @supplyinventory.id, qty_onhand, @supplyinventory.avg_cost)
      
      #create new transferred inventory record
      get_current_user
      @supplyinventorynew = Supplyinventory.new 
      @supplyinventorynew.user_id = @current_user.id
      @supplyinventorynew.supply_id = @supplyinventory.supply_id          
      @supplyinventorynew.supply_uom = @supplyinventory.supply_uom
      @supplyinventorynew.user_id = @supplyinventory.user_id
      @supplyinventorynew.storage_id = params[:supplyinventory][:storage_id]
      @supplyinventorynew.qty_onhand =  qty_onhand  
      @supplyinventorynew.qty_in =  qty_onhand    
      @supplyinventorynew.qty_out = 0
      @supplyinventorynew.onhand_value =  qty_onhand * @supplyinventory.avg_cost 
      @supplyinventorynew.avg_cost =  @supplyinventory.avg_cost 
      if @supplyinventorynew.save
          #write transaction record 
            SupplyinventoryTran.addtransaction("transfer_in", @supplyinventorynew.id, @supplyinventorynew.id, qty_onhand, @supplyinventorynew.avg_cost)
          
         return @success = true
         
      else
         
        return @success = false
        
      end
    else
       
      return @success = false
    end
  end
  
  def adjust_inventory
    qty_onhand =  params[:supplyinventory][:qty_onhand].to_f 
    #logger.debug "INVENTORY LOT INSPECT #{@supplyinventory.inspect}" 
    @supplyinventory.qty_onhand +=  qty_onhand  
    if qty_onhand > 0
        @supplyinventory.qty_in +=  qty_onhand 
    else
       @supplyinventory.qty_out -=  qty_onhand 
    end
     logger.debug "INVENTORY ONHAND AND AVG COST ---- #{@supplyinventory.qty_onhand} AND #{@supplyinventory.avg_cost}"
    @supplyinventory.onhand_value = @supplyinventory.qty_onhand * @supplyinventory.avg_cost

    if @supplyinventory.save
      #write transaction record 
        SupplyinventoryTran.addtransaction("adjustment", @supplyinventory.id, @supplyinventory.id, qty_onhand, @supplyinventory.avg_cost)
      
         return @success = true
    else       
         return @success = false
    end
  end
  
end
