class InventorylotsController < ApplicationController
  # GET /inventorylots
  # GET /inventorylots.xml
  
  before_filter :authenticate
 
 
  #-------supplies index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
        @inventorylots =  Inventorylot.find_by_sql("Select inventorylots.id, ticket_id, inventorylots.created_at, 
        cropplanfull, qty_onhand, inventorylots.inventory_uom, grade, lab_report, storages.name as storagename  
        from inventorylots 
        left join scaletickets on inventorylots.scaleticket_id = scaletickets.id 
        join cropplans on inventorylots.cropplan_id = cropplans.id
        join storages on inventorylots.storage_id = storages.id
        where inventorylots.user_id = #{@current_user.id } ")


      end

      def index_dbaction
    		#called for all db actions
    		cropplanfull = params["c0"]
    		storagename	 = params["c1"]
    		ticket_id	= params["c2"]
    		created_at = params["c3"]
    		inventory_uom = params["c4"]
    		qty_onhand = params["c5"]
    		grade = params["c6"]
    		lab_report = params["c7"]
    	

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@inventorylot = Inventorylot.find(@id)
    				@inventorylot.destroy

    				@tid = @id
    			when "updated"
    				@inventorylot = Inventorylot.find(@id)
    				@inventorylot.lab_report = lab_report

    				if @inventorylot.save

    				else
      				flash[:error] = @inventorylot.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end
#------------Standard ROR scaffold ----------------------------------------------------
  def index
    @inventorylots = Inventorylot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inventorylots }
    end
  end

  # GET /inventorylots/1
  # GET /inventorylots/1.xml
  def show
    @inventorylot = Inventorylot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventorylot }
    end
  end

  # GET /inventorylots/new
  # GET /inventorylots/new.xml
  def new
    @inventorylot = Inventorylot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inventorylot }
    end
  end

  # GET /inventorylots/1/edit
  def edit
    @inventorylot = Inventorylot.find(params[:id])

    @inventorylot_list =  Inventorylot.find_by_sql("Select inventorylots.id, ticket_id, inventorylots.created_at, 
    inventorylots.cropplan_id, cropname, cropspecific, plan_year, qty_onhand, qty_in, qty_out_ship, qty_out_transfer, inventorylots.inventory_uom, 
    grade, lab_report, inventorylots.storage_id, storages.name as storagename  
    from inventorylots 
    left join scaletickets on inventorylots.scaleticket_id = scaletickets.id 
    join cropplans on inventorylots.cropplan_id = cropplans.id
    join crops on cropplans.crop_id = crops.id
    join storages on inventorylots.storage_id = storages.id
    where inventorylots.id = #{params[:id]} limit 1")
  end
  
  def ship_detail
    @inventorylot = Inventorylot.find(params[:id])

    @inventorylot_list =  Inventorylot.find_by_sql("Select inventorylots.id, ticket_id, inventorylots.created_at, 
    inventorylots.cropplan_id, cropname, cropspecific, plan_year, qty_onhand, qty_in, qty_out_ship, qty_out_transfer, inventorylots.inventory_uom, 
    grade, lab_report, inventorylots.storage_id, storages.name as storagename  
    from inventorylots 
    left join scaletickets on inventorylots.scaleticket_id = scaletickets.id 
    join cropplans on inventorylots.cropplan_id = cropplans.id
    join crops on cropplans.crop_id = crops.id
    join storages on inventorylots.storage_id = storages.id
    where inventorylots.id = #{params[:id]} limit 1")
  end

  # POST /inventorylots
  # POST /inventorylots.xml
  def create
    @inventorylot = Inventorylot.new(params[:inventorylot])
    @inventorylot.transfer_amount = 0
    @inventorylot.qty_in = 0
    @inventorylot.qty_out_transfer = 0
    @inventorylot.qty_out_ship = 0
    

    respond_to do |format|
      if @inventorylot.save
        format.html { redirect_to(@inventorylot, :notice => 'Inventorylot was successfully created.') }
        format.xml  { render :xml => @inventorylot, :status => :created, :location => @inventorylot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inventorylot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inventorylots/1
  # PUT /inventorylots/1.xml
  def update
    @inventorylot = Inventorylot.find(params[:id])
  #logger.debug "COMPARISON PARAMS ONHAND #{params[:inventorylot][:qty_onhand]}" 
  #logger.debug "COMPARISON INVENTORYLOT ONHAND #{@inventorylot.qty_onhand}" 
    
      # qty edit
        parm_onhand = params[:inventorylot][:qty_onhand].to_f
        if parm_onhand > @inventorylot.qty_onhand
          #logger.debug "CONDITION 1" 
          flash[:error] = "transfer qty can not be greater than onhand qty. "
          @success = false
    
      #condition  - regrade and or transfer amount
        elsif params[:inventorylot][:storage_id].to_i != @inventorylot.storage_id.to_i 
          #logger.debug "CONDITION 2" 
          transfer_inventory
         
        elsif params[:inventorylot][:grade] != @inventorylot.grade and params[:inventorylot][:qty_onhand].to_i != @inventorylot.qty_onhand.to_i
         #logger.debug "CONDITION 3" 
          transfer_inventory
             
        elsif   params[:inventorylot][:grade] != @inventorylot.grade and params[:inventorylot][:qty_onhand].to_i == @inventorylot.qty_onhand.to_i        
          @inventorylot.grade = params[:inventorylot][:grade] 
          @inventorylot.lab_report = params[:inventorylot][:lab_report] 
             
          if @inventorylot.update_attributes(params[:inventorylot])
            @success = true 
                         
          else
            @sucess = false 
                        
          end
        else
          @inventorylot.grade = params[:inventorylot][:grade] 
          @inventorylot.lab_report = params[:inventorylot][:lab_report] 
             
          if @inventorylot.update_attributes(params[:inventorylot])
            @success = true 
                    
          else
            @sucess = false 
                         
          end
        end
    respond_to do |format|
        if @success == true
           
            format.html { redirect_to("/inventorylotview", :notice => 'Inventory was successfully created.') }
        else
           
            format.html {redirect_to(:controller => :inventorylots, :action => :edit, :id => @inventorylot.id) }
       end
    end
  end

  # DELETE /inventorylots/1
  # DELETE /inventorylots/1.xml
  def destroy
    @inventorylot = Inventorylot.find(params[:id])
    @inventorylot.destroy

    respond_to do |format|
      format.html { redirect_to(inventorylots_url) }
      format.xml  { head :ok }
    end
  end
  
  def transfer_inventory
    qty_onhand =  params[:inventorylot][:qty_onhand].to_f 
    
    @inventorylot.qty_onhand -=  qty_onhand  
    @inventorylot.qty_out_transfer +=  qty_onhand  
    @inventorylot.lab_report = params[:inventorylot][:lab_report]
    if @inventorylot.save
      #create new inventory record
       
      @inventorylotnew = Inventorylot.new 
      @inventorylotnew.cropplan_id = @inventorylot.cropplan_id          
      @inventorylotnew.scaleticket_id = @inventorylot.scaleticket_id
      @inventorylotnew.user_id = @inventorylot.user_id
      @inventorylotnew.inventory_uom = @inventorylot.inventory_uom
      @inventorylotnew.storage_id = params[:inventorylot][:storage_id]
      @inventorylotnew.grade = params[:inventorylot][:grade]
      @inventorylotnew.qty_onhand =  qty_onhand  
      @inventorylotnew.qty_in =  qty_onhand    
      @inventorylotnew.qty_out_ship = 0
      @inventorylotnew.qty_out_transfer = 0
      @inventorylotnew.transfer_amount = 0
      if @inventorylotnew.save
          
         return @success = true
         
      else
         
        return @success = false
        
      end
    else
       
      return @success = false
    end
  end
  

  
end
