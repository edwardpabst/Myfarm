class InvoicesController < ApplicationController
  # GET /invoices
  # GET /invoices.xml
  
  before_filter :authenticate
  
  #-------invoice index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
         @invoices = Invoice.find_by_sql("Select invoices.id, p1.partyname as customer, cropplanfull, invoice_number,
         invoice_date, invoice_status, invoices.ship_amount, ship_charge, total_amount, invoice_terms
        from invoices 
        join shipments sh on invoices.shipment_id = sh.id
        join parties p1 on sh.customer_id = p1.id 
        join cropplans on sh.cropplan_id = cropplans.id

        where invoices.user_id = #{@current_user.id} 
        order by invoice_date")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		customer = params["c0"]
    		cropplanfull	 = params["c1"]
    		invoice_number  	 = params["c2"]   
    		invoice_date	= params["c3"]
    		invoice_status = params["c4"]
    		ship_amount = params["c5"]
    		ship_charge = params["c6"]
    		total_amount = params["c7"]
    		
 

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"

      				@invoice = Invoice.find(@id)
      				shipment_id = @invoice.shipment_id
      				@invoice.destroy
      				
      				@shipment = Shipment.find(shipment_id)
      				if !@shipment.nil?
      				  @shipment.ship_status = 'shipped'
      				  @shipment.save
      				end
      			 
            
      				@tid = @id
  				   
    			when "updated"
    				@invoice = Invoice.find(@id)   	


    				if @invoice.save

    				else
      				flash[:error] = @invoice.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
    	
  #-------------Standard ROR -----------------------------------------------------------------


  # GET /invoices/1
  # GET /invoices/1.xml
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
  end
  
  def invoice_generator

    respond_to do |format|
      format.html # invoice_generator.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.xml
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.xml
  def create
    get_current_user
    @types = Type.find_by_typename('invoice_terms')
    @terms = 'none'
    
      @terms = @types.type_value_string  
     
    
    @shipments =  Invoice.get_ready_shipments(@current_user.id, params[:customer_id], params[:start_date],  params[:stop_date])
    @count = 0
 
    @shipments.each do  |sh|
      @invoice = Invoice.new(params[:invoice])
      @invoice.shipment_id = sh.id
      @invoice.ship_amount = sh.ship_amount
      @invoice.ship_charge = sh.shipping_charge
      @invoice.total_amount = sh.ship_amount.to_f + sh.shipping_charge.to_f
      @types = Type.find_by_typename('invoice_number')
       
        @invno = @types.type_value_integer + 1
        @types.type_value_integer = @invno
        @types.save
       
      @invoice.invoice_number = @invno
      @invoice.invoice_status = 'NEW'
      @invoice.invoice_terms = @terms
      @invoice.invoice_date = Date.today.to_date
      @invoice.user_id = @current_user.id  
      @count += 1
      @invoice.save
      
      @shipment = Shipment.find(sh.id)
      @shipment.ship_status = 'invoiced'
      @shipment.save
    end

    respond_to do |format|
        message = @count.to_s + ' - Invoice(s) were successfully created.'
        format.html { redirect_to('/invoice_generator', :notice => message) }
        format.xml  { render :xml => @invoice, :status => :created, :location => @invoice }

    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.xml
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to('/invoiceview', :notice => 'Invoice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.xml
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to(invoices_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def invoice_requestor 
    
    
    respond_to do |format|
      format.html

    end
       
  end
  
  def invoicereport
    
 
    
    respond_to do |format|
      format.html
      format.pdf do
        
        pdf = InvoicereportPdf.new(session[:s_user_id], view_context, params[:customer_id],params[:start_date], 
        params[:stop_date], params[:invoice_number], params[:reprint], params[:invoice_sort_sequence])
        send_data pdf.render, filename: "invoice_report",
                                type: "application/pdf",
                                disposition: "inline"
        
      end
    end
    
    
  end
end
