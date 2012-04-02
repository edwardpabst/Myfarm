class PodetailsController < ApplicationController
 
    # GET /podetails
    # GET /podetails.xml

    before_filter :authenticate


    #-------po detail index----------------------------------------------------------------------------
        def index_view


        end

        def index_data

          get_current_user
           @podetails = Podetail.find_by_sql("Select podetails.id, supplyname, qty_ordered, podetails.supply_uom,
                        order_price, ext_amount, qty_received, detail_status, storages.name as storagename 
          from podetails 
          join supplies on podetails.supply_id = supplies.id
          left join storages on podetails.storage_id = storages.id

          where podetails.user_id = #{@current_user.id } and podetails.po_id = #{session[:s_po_id]}")

          #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
          #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

        end

        def index_dbaction
      		#called for all db actions
      		supplyname = params["c0"]
      		qty_ordered	 = params["c1"]
      		supply_uom  	 = params["c2"]   
      		order_price	= params["c3"]
      		ext_amount = params["c4"]
      		detail_status = params["c5"]
      		qty_received = params["c6"]
      		storagename = params["c7"]
       


      		@mode = params["!nativeeditor_status"]

      		@id = params["gr_id"]
      		case @mode

      			when "deleted"

        				@podetail = Podetail.find(@id)
        				#adjust (replace) inventory
        				@podetail.destroy


        				@tid = @id

      			when "updated"
      				@podetail = Podetail.find(@id)
      				@podetail.detail_status = detail_status

          				if @podetail.save

                  else
            				flash[:error] = @podetail.errors 

          				end

  			   


  						@tid = @id
      		end 
      	end 

    #---------standard ROR scaffold ----------------------------------------------------------------

    def index
      @podetails = podetail.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @podetails }
      end
    end

    # GET /podetails/1
    # GET /podetails/1.xml
    def show
      @podetail = Podetail.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @podetail }
      end
    end

    # GET /podetails/new
    # GET /podetails/new.xml
    def new
      @podetail = Podetail.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @podetail }
      end
    end

    # GET /podetails/1/edit
    def edit
      @podetail = Podetail.find(params[:id])
    end
    
    def receive_line
       @podetail = Podetail.find_by_sql("Select podetails.id, supplyname, podetails.supply_uom, qty_ordered, 
                   qty_received, receipt_amount 
      from podetails 
      join supplies on podetails.supply_id = supplies.id
      where podetails.id = #{params[:id]}")
     
    end

    # POST /podetails
    # POST /podetails.xml

    def create
      @podetail = Podetail.new(params[:podetail])
      @podetail.user_id = session[:s_user_id]
      @podetail.po_id = session[:s_po_id]
      @podetail.detail_status = "open"
      @podetail.qty_received = 0
      @podetail.receipt_amount = 0
      @supply = Supply.find(@podetail.supply_id)
      if @podetail.supply_uom.nil?
        @podetail.supply_uom = @supply.supply_uom  
      end
      if @podetail.order_price.nil?
         @podetail.order_price = @supply.supply_cost_uom  
      end
        @podetail.ext_amount = @podetail.qty_ordered * @podetail.order_price
            
      respond_to do |format|
        if @podetail.save
          buildtotalamount(@podetail.po_id)
          @po = Po.find(@podetail.po_id)
          if @po.po_type = 'Immediate purchase' and @po.po_status = 'Received'
            immediate_inventory_update 
          end
          format.html { redirect_to(:controller => "pos",  :action => "edit", :id => session[:s_po_id], :notice => 'po line was successfully created.') }
          format.xml  { render :xml => @podetail, :status => :created, :location => @podetail }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @podetail.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /podetails/1
    # PUT /podetails/1.xml
    def update
      @podetail = Podetail.find(params[:id]) 
      if !params[:podetail][:receipt_amount].nil? 
          receipt_update
      else 
          @podetail.ext_amount = @podetail.qty_ordered * @podetail.order_price
          respond_to do |format|
            if @podetail.update_attributes(params[:podetail])
              buildtotalamount(@podetail.po_id)
              format.html { redirect_to(:controller => "pos",  :action => "edit", :id => session[:s_po_id], :notice => 'po detail was successfully updated.') }
              format.xml  { head :ok }
            else
              format.html { render :action => "edit" }
              format.xml  { render :xml => @podetail.errors, :status => :unprocessable_entity }
            end
          end
        end
    end
    
    def receipt_update
      @podetail = Podetail.find(params[:id])
      @error = false
      if params[:podetails][:storage_id].blank?
        flash[:error] = "You must select a storage area for the receipt. "        
        @error = true
      else
        @podetail.storage_id = params[:podetails][:storage_id]
        @podetail.receipt_amount = params[:podetail][:receipt_amount]
      end
      
      update_receipt_detail

    end
    
    def update_receipt_detail 
      @podetail.qty_received +=  @podetail.receipt_amount
      @receipt_amount = @podetail.receipt_amount
      @podetail.receipt_amount = 0
      @podetail.detail_status = "received"
      
      respond_to do |format|
        if @error == false
            if @podetail.save
              update_supply_inventory 
              buildtotalamount(@podetail.po_id)
              format.html { redirect_to(:controller => "pos",  :action => "edit", :id => session[:s_po_id], :notice => 'podetail was successfully updated.') }
              format.xml  { head :ok }
            else
              @error = true
            end
        end
        if @error == true
          format.html { redirect_to(:controller => "podetails",  :action => "receiveline", :id => @podetail.id) }
          format.xml  { render :xml => @podetail.errors, :status => :unprocessable_entity }
        end
        
      end
    end

    # DELETE /podetails/1
    # DELETE /podetails/1.xml
    def destroy
      @podetail = Podetail.find(params[:id])
      @podetail.destroy

      respond_to do |format|
        format.html { redirect_to(podetails_url) }
        format.xml  { head :ok }
      end
    end
    
    def buildtotalamount(id)

      @podetails = Podetail.find_by_sql("Select ext_amount 
      from podetails
      where podetails.user_id = #{@current_user.id } and podetails.po_id = #{id}")
      totalamount = 0
      @podetails.each do |pd|
        totalamount += pd.ext_amount
      end
      @po = Po.find(id)
      @po.order_amount = totalamount
      @po.save
    end
    
    def immediate_inventory_update

       @podetail = Podetail.find(@podetail.id) 
        @storage = Storage.find_by_is_supply_default(true)
         #logger.debug "STORAGE INSPECT FOR EXIST - #{@storage.id}"
        if !@storage.nil?
             @podetail.storage_id = @storage.id
        else
          @storage = Storage.find(:first)
           @podetail.storage_id = @storage.id
        end
        
        @podetail.receipt_amount =  @podetail.qty_ordered
        
        @receipt_amount =  @podetail.qty_ordered
        @podetail.qty_received +=  @podetail.qty_ordered
        @podetail.receipt_amount = 0
        @podetail.detail_status = "received"
        if @podetail.save
          update_supply_inventory 
          buildtotalamount(@podetail.po_id)
        end 
    
    end
    
    def update_supply_inventory 

        get_current_user
      @supplyinventory = Supplyinventory.where('user_id' => @current_user.id , 'supply_id' => @podetail.supply_id , 'storage_id' => @podetail.storage_id)
      
      receipt_amount = @receipt_amount.to_f
 
       if @supplyinventory.empty?
        #add new inventory record
        
         @supplyinventory = Supplyinventory.new
         @supplyinventory.supply_id = @podetail.supply_id
         @supplyinventory.storage_id = @podetail.storage_id
         @supplyinventory.qty_in = receipt_amount
         @supplyinventory.qty_onhand = receipt_amount
         @supplyinventory.supply_uom = @podetail.supply_uom
         @supplyinventory.user_id = session[:s_user_id]
         @supplyinventory.qty_out = 0
         @supplyinventory.onhand_value =  @podetail.ext_amount 
         @supplyinventory.avg_cost = @podetail.order_price
         @supplyinventory.save
      else
        #update inventory record
        @supplyinventory.each do |si|
          @supplyinv = Supplyinventory.find(si.id)
          @supplyinv.qty_in += receipt_amount
          @supplyinv.qty_onhand += receipt_amount
          @supplyinv.onhand_value +=  @podetail.ext_amount 
          @supplyinv.avg_cost = @supplyinv.onhand_value / @supplyinv.qty_onhand 
          @supplyinv.save  
          @supplyinventory = @supplyinv
        end     
      end
      
    #write transaction record 
      SupplyinventoryTran.addtransaction("po_receipt", @supplyinventory.id, @podetail.id, receipt_amount, @podetail.order_price)

    end
  end
  