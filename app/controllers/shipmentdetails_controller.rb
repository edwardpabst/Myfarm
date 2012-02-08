class ShipmentdetailsController < ApplicationController
  # GET /shipmentdetails
  # GET /shipmentdetails.xml
  
  before_filter :authenticate


  #-------scaleticket index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
         @shipmentdetails = Shipmentdetail.find_by_sql("Select shipmentdetails.id, cropplanfull, storages.name as storagename, 
         inventorylots.grade, qty, qty_uom, price, ext_amount, detail_status, notes 
        from shipmentdetails 
        join cropplans on shipmentdetails.cropplan_id = cropplans.id
        join inventorylots on shipmentdetails.inventorylot_id = inventorylots.id
        join storages on inventorylots.storage_id = storages.id

        where shipmentdetails.user_id = #{@current_user.id } and shipmentdetails.shipment_id = #{session[:s_shipment_id]}")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		cropplanfull = params["c0"]
    		storagename	 = params["c1"]
    		grade  	 = params["c2"]   
    		qty	= params["c3"]
    		price = params["c4"]
    		qty_uom = params["c5"]
    		ext_amount = params["c6"]
    		detail_status = params["c7"]
    		notes = params["c8"]
 

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"

      				@shipmentdetail = Shipmentdetail.find(@id)
      				#adjust (replace) inventory
      				@inventorylot = Inventorylot.find(@shipmentdetail.inventorylot_id)
      				@inventorylot.qty_onhand += @shipmentdetail.qty
      				@inventorylot.qty_out_ship -= @shipmentdetail.qty
      				@inventorylot.save
      				@shipmentdetail.destroy
      			 
            
      				@tid = @id
  				   
    			when "updated"
    				@shipmentdetail = Shipmentdetail.find(@id)
    				@shipmentdetail.notes = notes
    				@shipmentdetail.detail_status = detail_status
    				holdqty = qty.to_f
    				if holdqty > @shipmentdetail.original_inv_amount
    		 
    				     flash[:error] = "you can not increase the inventory of the shipment detail. If you need more then get it from inventory"
     			      respond_to do |format|
     			        format.html { redirect_to(:controller => "shipments", :action => "edit", :id => session[:s_shipment_id]) }            
      				  end
    				else 
    	 
    			    	@inventorylot = Inventorylot.find(@shipmentdetail.inventorylot_id)
        				@inventorylot.qty_onhand +=  (@shipmentdetail.qty - holdqty)
        				@inventorylot.qty_out_ship -= (@shipmentdetail.qty - holdqty)
        				@inventorylot.save   	

                @shipmentdetail.qty = qty
                @shipmentdetail.price = price
                @shipmentdetail.ext_amount = @shipmentdetail.qty * @shipmentdetail.price

        				if @shipmentdetail.save
 
                else
          				flash[:error] = @shipmentdetail.errors 
             				  
        				end

			      end
	 	      

						@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ----------------------------------------------------------------
  
  def index
    @shipmentdetails = Shipmentdetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipmentdetails }
    end
  end

  # GET /shipmentdetails/1
  # GET /shipmentdetails/1.xml
  def show
    @shipmentdetail = Shipmentdetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipmentdetail }
    end
  end

  # GET /shipmentdetails/new
  # GET /shipmentdetails/new.xml
  def new
    @shipmentdetail = Shipmentdetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipmentdetail }
    end
  end

  # GET /shipmentdetails/1/edit
  def edit
    @shipmentdetail = Shipmentdetail.find(params[:id])
  end

  # POST /shipmentdetails
  # POST /shipmentdetails.xml
  def add_detail
    
    @ship_qty =  params[:ship_qty].to_f 
    @inventorylot_id = params[:inventorylot_id].to_i 

    @inventorylots = Inventorylot.find(@inventorylot_id)
    
    if @ship_qty > 0
      
        @shipmentdetail = Shipmentdetail.new()
        @shipmentdetail.user_id = session[:s_user_id]
        @shipmentdetail.shipment_id = session[:s_shipment_id]
        @shipmentdetail.inventorylot_id = @inventorylot_id
    

        @shipmentdetail.qty = @ship_qty
        @shipmentdetail.original_inv_amount = @ship_qty
        @shipmentdetail.qty_uom = @inventorylots.inventory_uom
    
        @shipmentdetail.cropplan_id = @inventorylots.cropplan_id
    
        @shipment = Shipment.find(@shipmentdetail.shipment_id)
    
        #--- Determine price for the shipment
        if !@shipment.contract_id.blank?
          @contract = Contract.find(@shipment.contract_id)
          @shipmentdetail.price = @contract.contract_price
          @shipmentdetail.notes = @contract.notes
        else 
          @cropplan = Cropplan.find(@shipmentdetail.cropplan_id)
          @crop = Crop.find(@cropplan.crop_id)
          @shipmentdetail.price = @crop.price_per_uom
          @shipmentdetail.notes = ""
        end
     
        @shipmentdetail.ext_amount = @shipmentdetail.qty * @shipmentdetail.price
        @shipmentdetail.detail_status = "Shipped"
    
    
        respond_to do |format|
           
  
          if @shipmentdetail.save
        
            #decrement inventory record
            @inventorylot = Inventorylot.find(@shipmentdetail.inventorylot_id) 
            @inventorylot.qty_out_ship += @ship_qty
            @inventorylot.qty_onhand -= @ship_qty
            @inventorylot.transfer_amount = 0  
            @inventorylot.save
        
        
            format.html { redirect_to(:controller => "shipments", :action => "edit", :id => session[:s_shipment_id], :notice => 'Shipmentdetail was successfully created.') }
            format.xml  { render :xml => @shipmentdetail, :status => :created, :location => @shipmentdetail }
          else
            format.html { redirect_to(:controller => "shipments", :action => "edit", :id => session[:s_shipment_id], :notice => 'Shipmentdetail was NOT added. See error messages.') }
           format.xml  { render :xml => @shipmentdetail.errors, :status => :unprocessable_entity }
          end
        end
    else
         flash[:notice] = 'No amount was entered for the selected inventory line. Line not added.'
         redirect_to(:controller => "shipments", :action => "edit", :id => session[:s_shipment_id])
    end
  end
  
  def create
    @shipmentdetail = Shipmentdetail.new(params[:shipmentdetail])
    @shipmentdetail.user_id = session[:s_user_id]
    respond_to do |format|
      if @shipmentdetail.save
        format.html { redirect_to(@shipmentdetail, :notice => 'Shipmentdetail was successfully created.') }
        format.xml  { render :xml => @shipmentdetail, :status => :created, :location => @shipmentdetail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipmentdetail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shipmentdetails/1
  # PUT /shipmentdetails/1.xml
  def update
    @shipmentdetail = Shipmentdetail.find(params[:id])

    respond_to do |format|
      if @shipmentdetail.update_attributes(params[:shipmentdetail])
        format.html { redirect_to(@shipmentdetail, :notice => 'Shipmentdetail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipmentdetail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipmentdetails/1
  # DELETE /shipmentdetails/1.xml
  def destroy
    @shipmentdetail = Shipmentdetail.find(params[:id])
    @shipmentdetail.destroy

    respond_to do |format|
      format.html { redirect_to(shipmentdetails_url) }
      format.xml  { head :ok }
    end
  end
end
