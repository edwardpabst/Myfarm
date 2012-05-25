class ShipmentsController < ApplicationController
  # GET /shipments
  # GET /shipments.xml
  
  before_filter :authenticate


  #-------shipment index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
         @shipments = Shipment.find_by_sql("Select shipments.id, p1.partyname as customername, cropplanfull, ship_date, 
         p2.partyname as truckcompany,  manifest_id, commission_amount, shipping_charge, ship_status, ship_amount  
        from shipments 
        join parties p1 on shipments.customer_id = p1.id 
        left join parties p2 on shipments.trucker_id = p2.id 
        join cropplans on shipments.cropplan_id = cropplans.id

        where shipments.user_id = #{@current_user.id } ")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		customername = params["c0"]
    		cropplanfull	 = params["c1"]
    		ship_date   	 = params["c2"]   
    		ship_status	= params["c3"]
    		manifest_id = params["c4"]
    		shipping_charge = params["c5"]
    		commission_amount = params["c6"]
 

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"

      				@shipment = Shipment.find(@id)
      				@shipment.destroy
      			 
            
      				@tid = @id
  				   
    			when "updated"
    				@shipment = Shipment.find(@id)
    				@shipment.manifest_id = manifest_id     	


    				if @shipment.save

    				else
      				flash[:error] = @shipment.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
    	
  #-------------Inventory views -----------------------------------------------------------------
     def inventory_view


     end

      def inventory_data

     
          get_current_user
          get_current_shipment
          
          @inventorylots =  Inventorylot.find_by_sql("Select inventorylots.id,  cropplanfull, qty_onhand, inventorylots.inventory_uom, grade, transfer_amount, storages.name as storagename  
          from inventorylots 
          join cropplans on inventorylots.cropplan_id = cropplans.id
          join storages on inventorylots.storage_id = storages.id
          where inventorylots.user_id = #{@current_user.id }  
          and inventorylots.cropplan_id = #{@shipment.cropplan_id} 
          and inventorylots.qty_onhand > 0")

          #left join scaletickets on inventorylots.scaleticket_id = scaletickets.id 
          #left join fields on scaletickets.field_id_1 = fields.id
          #and fields.farm_id = #{@shipment.farm_id}

      end

      def inventory_dbaction
    	  	#called for all db actions
      		
      		cropplanfull	 = params["c0"]
      		storagename = params["c1"]
      		grade   	 = params["c2"]   
      		inventory_uom	= params["c3"]
      		qty_onhand = params["c4"]
      		transfer_amount = params["c5"]

    

      		@mode = params["!nativeeditor_status"]

      		@id = params["gr_id"]
      		case @mode

      			when "deleted"

    				  
      			when "updated"
      				@inventorylot = Inventorylot.find(@id)
      				@inventorylot.transfer_amount = transfer_amount

      				if @inventorylot.save

      				else
        				flash[:error] = @inventorylot.errors 
                render 'index_view' 				  
      				end

      				@tid = @id
      		end
    	end
  
  #---------standard ROR scaffold ----------------------------------------------------------------
  
  def index
    @shipments = Shipment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipments }
    end
  end

  # GET /shipments/1
  # GET /shipments/1.xml
  def show
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  # GET /shipments/new
  # GET /shipments/new.xml
  def new
    @shipment = Shipment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  # GET /shipments/1/edit
  def edit
    session[:s_shipment_id] = params[:id]
    @shipment = update_shipment_amount(params[:id])
    @onload = 'checkShipment()'

  end

  # POST /shipments
  # POST /shipments.xml
  def create
    @shipment = Shipment.new(params[:shipment])
    @shipment.user_id = session[:s_user_id]
    @error = false
    if params[:shipment][:customer_id] != "" and params[:shipment][:contract_id] != ""
      @error = true
      flash[:error] = "Either select a customer or a contract for the shipment but not both. A contract belongs to a customer. " 
    end
    
    if params[:shipment][:contract_id] != ""
       @contract = Contract.find(@shipment.contract_id)
       @shipment.customer_id = @contract.party_id
       @shipment.cropplan_id = @contract.cropplan_id
    end
    
    if params[:shipment][:shipto_street].blank? || params[:shipment][:shipto_street].nil?
      if !@shipment.customer_id.nil?
      @party = Party.find(@shipment.customer_id)
          if @party.ship_address1.blank? || @party.ship_address1.nil?
            #use mailing address
            @shipment.shipto_street = @party.partyaddress1
            @shipment.shipto_city = @party.partycity
            @shipment.shipto_state = @party.partystate
            @shipment.shipto_postalcode = @party.partypostalcode
          else
            #use shipping address
            @shipment.shipto_street = @party.ship_address1
            @shipment.shipto_city = @party.ship_city
            @shipment.shipto_state = @party.ship_state
            @shipment.shipto_postalcode = @party.ship_postalcode
          end
      end
    end
       
    respond_to do |format|
    if @error == false
      if @shipment.save
          
        format.html { redirect_to(:action => :edit, :id => @shipment.id, :notice => 'Shipment was successfully created.') }
        format.xml  { render :xml => @shipment, :status => :created, :location => @shipment }
      else
        @error = true
         
      end
    end
   
    if @error == true
       
      format.html { render :action => "new" }
      format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
    end
    end
  end

  # PUT /shipments/1
  # PUT /shipments/1.xml
  def update
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      if @shipment.update_attributes(params[:shipment])
        format.html { redirect_to("/shipmentview", :notice => 'Shipment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.xml
 
  def destroy
    @shipment = Shipment.find(params[:id])
    begin
      @shipment.destroy 
      rescue ActiveRecord::DeleteRestrictionError => e
      @shipment.errors.add(:base, e)
    end 
    respond_to do |format|

        if e.nil?

          format.html { redirect_to("/shipmentview", :notice => 'shipment was successfully deleted.') }
          format.xml  { head :ok }
        else          
          format.html { render :action => "edit" }
        end


    end
  end
  
  def update_shipment_amount(id)
    @shipment = Shipment.find(id)
    @ship_amount = Shipmentdetail.find_all_by_shipment_id(id) 
  
    if !@ship_amount.nil? 
      amount = 0
      @ship_amount.each do |sa|
        amount += (sa.qty * sa.price)
      end
      @shipment.ship_amount = amount
    else
      @shipment.ship_amount = 0     
    end
    @shipment.save
    return @shipment
  end
end
