class RetailorderdetailsController < ApplicationController
  # GET /retailorderdetails
  # GET /retailorderdetails.xml
  
    before_filter :authenticate

      def index_view


      end

      def index_data
        get_current_user
       
         @retailorderdetails = Retailorderdetail.find_by_sql("Select rod.*, cropplanfull
         from retailorderdetails rod
         join cropplans cp on rod.cropplan_id = cp.id
        where rod.retailorder_id = #{session[:s_retailorder_id]} ")

      end


      def index_dbaction
    		#called for all db actions
    		detail_notes	= params["c7"]
      		#called for all db actions



      		@mode = params["!nativeeditor_status"]

      		@id = params["gr_id"]
      		case @mode
      			when "inserted"
      				@retailorderdetail = Retailorderdetail.new

      				if @retailorderdetail.save

      				else
                flash[:error] = @retailorderdetail.errors 
                render 'index_view'				  
      				end

      				@tid = @retailorderdetail.id
      			when "deleted"
      				@retailorderdetail=Retailorderdetail.find(@id)
      				@retailorderdetail.destroy

      				@tid = @id
      			when "updated"
      				@retailorderdetail = Retailorderdetail.find(@id)

              @retailorderdetail.detail_notes = detail_notes
      				if @retailorderdetail.save

      				else
        				flash[:error] = @retailorderdetail.errors 
                render 'index_view' 				  
      				end

      				@tid = @id
      		end 
      	end

  #-------- Standard ROR scaffold --------------------------------------------
  def index
    @retailorderdetails = Retailorderdetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @retailorderdetails }
    end
  end

  # GET /retailorderdetails/1
  # GET /retailorderdetails/1.xml
  def show
    @retailorderdetail = Retailorderdetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retailorderdetail }
    end
  end

  # GET /retailorderdetails/new
  # GET /retailorderdetails/new.xml
  def additem
    @retailorderdetail = Retailorderdetail.new
    @retailcrop = Retailcrop.find(params[:id]) 
    @cropplan = Cropplan.find(@retailcrop.cropplan_id) 
    @retailorderdetail.user_id = session[:s_user_id]
    @retailorderdetail.retailorder_id = session[:s_retailorder_id]
    @retailorderdetail.cropplan_id = @retailcrop.cropplan_id
    @retailorderdetail.retailcrop_id = @retailcrop.id
    @retailorderdetail.detail_qty = 0
    @retailorderdetail.detail_price = @retailcrop.sales_price
    @retailorderdetail.detail_uom = @retailcrop.sales_uom
    @retailorderdetail.detail_notes = @retailcrop.sales_notes
    @retailorderdetail.detail_ext_amount = 0
    @retailorderdetail.detail_shipcharge = @retailcrop.ship_charge
    @retailorderdetail.detail_status = 'New'
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retailorderdetail }
    end
  end
  
  def new
    @retailorderdetail = Retailorderdetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retailorderdetail }
    end
  end

  # GET /retailorderdetails/1/edit
  def edit
    @retailorderdetail = Retailorderdetail.find(params[:id])
  end

  # POST /retailorderdetails
  # POST /retailorderdetails.xml
  def create
    @retailorderdetail = Retailorderdetail.new(params[:retailorderdetail])
    @retailorderdetail.detail_ext_amount = @retailorderdetail.detail_price * @retailorderdetail.detail_qty
    
    respond_to do |format|
      if @retailorderdetail.save
        format.html { redirect_to(:controller => :retailorders, :action => :edit, :id => session[:s_retailorder_id], 	:notice => 'Item was successfully added to the order.') }
        format.xml  { render :xml => @retailorderdetail, :status => :created, :location => @retailorderdetail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retailorderdetail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retailorderdetails/1
  # PUT /retailorderdetails/1.xml
  def update
    @retailorderdetail = Retailorderdetail.find(params[:id])

    respond_to do |format|
      if @retailorderdetail.update_attributes(params[:retailorderdetail])
        format.html { redirect_to(:controller => :retailorders, :action => :edit, :id => session[:s_retailorder_id], 	:notice => 'Item was successfully updated.') }
       format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retailorderdetail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retailorderdetails/1
  # DELETE /retailorderdetails/1.xml
  def destroy
    @retailorderdetail = Retailorderdetail.find(params[:id])
    @retailorderdetail.destroy

    respond_to do |format|
      format.html { redirect_to(retailorderdetails_url) }
      format.xml  { head :ok }
    end
  end
end
