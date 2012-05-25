class PosController < ApplicationController
 

     before_filter :authenticate


     #-------shipment index----------------------------------------------------------------------------
         def index_view


         end

         def index_data

           get_current_user
            @pos = Po.find_by_sql("Select pos.id, partyname as suppliername,  ponumber, orderdate, duedate,
                  po_type, po_status, order_amount, notes  
           from pos 
           join parties  on pos.supplier_id = parties.id 

           where pos.user_id = #{@current_user.id } ")

           #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
           #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

         end

         def index_dbaction
       		#called for all db actions
       		suppliername = params["c0"]
       		ponumber	 = params["c1"]
       		orderdate   	 = params["c2"]   
       		duedate	= params["c3"]
       		po_type = params["c4"]
       		po_statue = params["c5"]
       		order_amount = params["c6"]
       		notes = params["c7"]


       		@mode = params["!nativeeditor_status"]

       		@id = params["gr_id"]
       		case @mode

       			when "deleted"

         				@po = Po.find(@id)
         				@po.destroy


         				@tid = @id

       			when "updated"
       				@po = Po.find(@id)
       				@po.notes = notes     	


       				if @po.save

       				else
         				flash[:error] = @po.errors 
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

             @inventorylots =  Inventorylot.find_by_sql("Select inventorylots.id,  cropplanfull, qty_onhand, inventory_uom, grade, transfer_amount, storages.name as storagename  
             from inventorylots 
             join scaletickets on inventorylots.scaleticket_id = scaletickets.id 
             join cropplans on inventorylots.cropplan_id = cropplans.id
             join storages on inventorylots.storage_id = storages.id
             where inventorylots.user_id = #{@current_user.id }  and inventorylots.cropplan_id = #{@shipment.cropplan_id} and inventorylots.qty_onhand > 0")




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
       @pos = Po.all

       respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @shipments }
       end
     end

  
     def show
       @po = Po.find(params[:id])

       respond_to do |format|
         format.html # show.html.erb
         format.xml  { render :xml => @shipment }
       end
     end

 
     def new
       @po = Po.new

       respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @shipment }
       end
     end

     # GET /shipments/1/edit
     def edit
       @po = Po.find(params[:id])
       session[:s_po_id] = @po.id
      # @onload = 'checkContract()'
     end

 
     def create
       @po = Po.new(params[:po])
       @po.user_id = session[:s_user_id]
       @error = false
 
 

       respond_to do |format|
     
         if @po.save

           format.html { redirect_to(:action => :edit, :id => @po.id, :notice => 'Purchase order was successfully created.') }
           format.xml  { render :xml => @po, :status => :created, :location => @po }
         else
           @error = true
           format.html { render :action => "new" }
            format.xml  { render :xml => @po.errors, :status => :unprocessable_entity }
         end
       end
 
     
     end

     # PUT /shipments/1
     # PUT /shipments/1.xml
     def update
       @po = Po.find(params[:id])

       respond_to do |format|
         if @po.update_attributes(params[:po])
           flash[:notice] = 'Purchase order was successfully updated'
           format.html { redirect_to(:action => :edit, :id => @po.id, :notice => 'Purchase order was successfully updated.') }
           
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @po.errors, :status => :unprocessable_entity }
         end
       end
     end

     # DELETE /shipments/1
     # DELETE /shipments/1.xml
     def destroy
       @po = Po.find(params[:id])
       begin
         @po.destroy 
         rescue ActiveRecord::DeleteRestrictionError => e
         @po.errors.add(:base, e)
       end 
       respond_to do |format|

           if e.nil?

             format.html { redirect_to("/poview", :notice => 'purchase order was successfully deleted.') }
             format.xml  { head :ok }
           else          
             format.html { render :action => "edit" }
           end


       end
    end
    
   end
   