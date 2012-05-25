class ScaleticketsController < ApplicationController
  # GET /scaletickets
  # GET /scaletickets.xml
  
  before_filter :authenticate


  #-------scaleticket index----------------------------------------------------------------------------
      def index_view
        cookies.delete(:s_cropplan_id) 
        cookies.delete(:s_storage_id)  
        cookies.delete(:s_inventory_update)  
        cookies.delete(:s_tran_date) 
        cookies.delete(:s_field_id_1)  
        cookies.delete(:s_field_pct_1) 
        cookies.delete(:s_field_id_2)  
        cookies.delete(:s_field_pct_2)  
        cookies.delete(:s_field_id_3)  
        cookies.delete(:s_field_pct_3)  
        cookies.delete(:s_field_id_4)  
        cookies.delete(:s_field_pct_4) 
        cookies.delete(:weight_conversion)  
        cookies.delete(:inventory_uom)
      end

      def index_data

        get_current_user
         @scaletickets = Scaleticket.find_by_sql("Select scaletickets.id, ticket_id, tran_date, cropplanfull, 
         pack_qty, inventory_uom, grade, gross_weight, tare_weight, net_weight, storages.name as storagename, moisture_pct 
        from scaletickets  
        join cropplans on scaletickets.cropplan_id = cropplans.id
        left join storages on scaletickets.storage_id = storages.id
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
    			  if !@inventorylot.nil?
        			  if @inventorylot.qty_out_ship > 0 || @inventorylot.qty_out_transfer > 0
        			    flash[:error] = "this scale ticket can not be deleted because it has inventory activity. "
                  render 'index_view'
        			  else
          				@scaleticket = Scaleticket.find(@id)
          				@scaleticket.destroy
          				@inventorylot.destroy
            
          				@tid = @id
      				  end
				    else
				      @scaleticket = Scaleticket.find(@id)
      				@scaleticket.destroy
        
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
    @transaction = "new"
    @typeprefix = Type.find_by_typename("scaleticket_prefix")
    @typenumber = Type.find_by_typename("scaleticket_number")
    @typenumber.type_value_integer += 1
    @typenumber.save    
    @scaleticket.ticket_id = (@typeprefix.type_value_string + @typenumber.type_value_integer.to_s)
    
    @scaleticket.cropplan_id = session[:s_cropplan_id]  
    @scaleticket.storage_id = session[:s_storage_id]  
    @scaleticket.inventory_update = session[:s_inventory_update]  
    @scaleticket.tran_date = session[:s_tran_date]  
    @scaleticket.field_id_1 = session[:s_field_id_1]  
    @scaleticket.field_pct_1 = session[:s_field_pct_1] 
    @scaleticket.field_id_2 = session[:s_field_id_2]  
    @scaleticket.field_pct_2 = session[:s_field_pct_2]  
    @scaleticket.field_id_3 = session[:s_field_id_3]  
    @scaleticket.field_pct_3 = session[:s_field_pct_3]  
    @scaleticket.field_id_4 = session[:s_field_id_4]  
    @scaleticket.field_pct_4 = session[:s_field_pct_4] 
    @scaleticket.weight_conversion = session[:weight_conversion]  
    @scaleticket.inventory_uom = session[:inventory_uom]  
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scaleticket }
    end
  end
  
  def set_ticket
    @scaleticket = Scaleticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scaleticket }
    end
  end
  
  def set_defaults
    
    session[:s_cropplan_id] = params[:scaleticket][:cropplan_id]
    session[:s_storage_id] = params[:scaleticket][:storage_id]
    session[:s_inventory_update] = params[:scaleticket][:inventory_update]
    session[:s_tran_date] = params[:scaleticket][:tran_date]
    session[:s_field_id_1] = params[:scaleticket][:field_id_1]
    session[:s_field_pct_1] = params[:scaleticket][:field_pct_1]
    session[:s_field_id_2] = params[:scaleticket][:field_id_2]
    session[:s_field_pct_2] = params[:scaleticket][:field_pct_2]
    session[:s_field_id_3] = params[:scaleticket][:field_id_3]
    session[:s_field_pct_3] = params[:scaleticket][:field_pct_3]
    session[:s_field_id_4] = params[:scaleticket][:field_id_4]
    session[:s_field_pct_4] = params[:scaleticket][:field_pct_4]
    
    if !params[:scaleticket][:cropplan_id].nil? 
      @cropplan = Cropplan.find(params[:scaleticket][:cropplan_id].to_i)
      @crop = Crop.find(@cropplan.crop_id)
      session[:weight_conversion] = @crop.avg_weight_uom
      session[:inventory_uom] = @crop.crop_inventory_uom
    end

    respond_to do |format|
      format.html { redirect_to(:controller => :scaletickets, :action => :new, :notice => 'Begin entering scale tickets.') }
      format.xml  { render :xml => @scaleticket, :status => :created, :location => @scaleticket }
    end
  end

  # GET /scaletickets/1/edit
  def edit
    @scaleticket = Scaleticket.find(params[:id])
    @cropplan = Cropplan.find(@scaleticket.cropplan_id)
    @storage = Storage.find(@scaleticket.storage_id)
    @transaction = "edit"
  end

  # POST /scaletickets
  # POST /scaletickets.xml
  def create
    @scaleticket = Scaleticket.new(params[:scaleticket])
    @scaleticket.user_id = session[:s_user_id]

    
    @cropplan = Cropplan.find(@scaleticket.cropplan_id)
    if !@cropplan.nil? 
      @crop = Crop.find(@cropplan.crop_id)
      @scaleticket.weight_conversion = @crop.avg_weight_uom
      @scaleticket.inventory_uom = @crop.crop_inventory_uom
    end
    
    respond_to do |format|
      if @scaleticket.save
        @update_amount = @scaleticket.pack_qty
        
        update_crop_inventory
        
          format.html { redirect_to(:controller => :scaletickets, :action => :new, :notice => 'Scaleticket created. Add next ticket.') }
          format.xml  { render :xml => @scaleticket, :status => :created, :location => @scaleticket }
 
      else
        @transaction = "new"
        format.html { render :action => "new" }
        format.xml  { render :xml => @scaleticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scaletickets/1
  # PUT /scaletickets/1.xml
  def update
    @scaleticket = Scaleticket.find(params[:id])
    @original_qty = @scaleticket.pack_qty.to_f
     
    respond_to do |format|
      if @scaleticket.update_attributes(params[:scaleticket])
        
        @update_amount = (@scaleticket.pack_qty - @original_qty)
         
        update_crop_inventory
                  
        format.html { redirect_to("/scaleticketview", :notice => 'Scaleticket was successfully updated.') }
        format.xml  { head :ok }
      else
        @transaction = "edit"
      
        @cropplan = Cropplan.find(@scaleticket.cropplan_id)
        @storage = Storage.find(@scaleticket.storage_id)
        @transaction = "edit"
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scaleticket.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /scaletickets/1
  # DELETE /scaletickets/1.xml
  def destroy
    @scaleticket = Scaleticket.find(params[:id])
    begin
      @scaleticket.destroy 
      rescue ActiveRecord::DeleteRestrictionError => e
      @scaleticket.errors.add(:base, e)
    end 
    respond_to do |format|

        if e.nil?

          format.html { redirect_to("/scaleticketview", :notice => 'scale ticket was successfully deleted.') }
          format.xml  { head :ok }
        else  
          @cropplan = Cropplan.find(@scaleticket.cropplan_id)
          @storage = Storage.find(@scaleticket.storage_id)
          @transaction = "edit"        
          format.html { render :action => "edit" }
        end


    end
  end
  
  def update_crop_inventory
    
    #---- update inventory record for scaleticket -------------------
    if @scaleticket.inventory_update == "Consolidated"
      @inventorylothold = Inventorylot.where('user_id' => @current_user.id , 'cropplan_id' => @scaleticket.cropplan_id , 'storage_id' => @scaleticket.storage_id, 'scaleticket_id' => 0, 'grade' => @scaleticket.grade)
      @inventorylothold.each do |inventorylot|
        @inventorylot = inventorylot
      end
      
    else
      @inventorylothold = Inventorylot.find_by_scaleticket_id(@scaleticket.id)
      @inventorylot = @inventorylothold
      
    end 
     
     if !@inventorylot.nil?
        if @scaleticket.inventory_update  == "Consolidated"
          @inventorylot.qty_in += @update_amount
          @inventorylot.qty_onhand += @update_amount
          @inventorylot.save
          
        else
          @inventorylot.qty_in = @scaleticket.pack_qty
          @inventorylot.qty_onhand = @scaleticket.pack_qty
          @inventorylot.inventory_uom = @scaleticket.inventory_uom
          @inventorylot.save
          
        end

     else
       #---- create inventory record for scaleticket ------------------- 
        @inventorylot = Inventorylot.new
        if @scaleticket.inventory_update == "Consolidated"
          @inventorylot.scaleticket_id = 0
        else
          @inventorylot.scaleticket_id = @scaleticket.id
        end
        @inventorylot.user_id = @scaleticket.user_id            
        @inventorylot.storage_id = @scaleticket.storage_id
        @inventorylot.cropplan_id = @scaleticket.cropplan_id
        @inventorylot.qty_in = @scaleticket.pack_qty
        @inventorylot.qty_onhand = @scaleticket.pack_qty
        @inventorylot.qty_out_ship = 0
        @inventorylot.qty_out_transfer = 0
        @inventorylot.transfer_amount = 0
        @inventorylot.inventory_uom = @scaleticket.inventory_uom
        @inventorylot.grade =   @scaleticket.grade
        @inventorylot.lab_report = ""
        @inventorylot.save
         
     end
     
     # create/update inventory ticket
     
     @inventoryticket = Inventoryticket.find_by_scaleticket_id(@scaleticket.id)
     if !@inventoryticket.nil?
       @inventoryticket.pack_qty += @update_amount
     else
       @inventoryticket = Inventoryticket.new
       @inventoryticket.scaleticket_id = @scaleticket.id
       @inventoryticket.inventorylot_id = @inventorylot.id
       @inventoryticket.field_id = @scaleticket.field_id_1
       @inventoryticket.inventory_uom = @scaleticket.inventory_uom
       @inventoryticket.pack_qty = @update_amount
       @inventoryticket.save
       
     end
    
  end


  def scaleticket_requestor 


     respond_to do |format|
       format.html

     end

   end

   def scaleticketreport


      #logger.debug "scale ticket REPORT  PARAMS- CROP -#{params[:cropplan_id]} FIELD -#{params[:field_id]} "
     respond_to do |format|
       format.html
       format.pdf do

         pdf = ScaleticketreportPdf.new(session[:s_user_id], view_context, params[:cropplan_id], params[:field_id],
         params[:start_date], params[:stop_date])
         send_data pdf.render, filename: "scaleticket_report",
                                 type: "application/pdf",
                                 disposition: "inline"

       end
     end


   end  

end

