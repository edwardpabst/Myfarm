class CropsController < ApplicationController
  # GET /crops
  # GET /crops.xml
  
  before_filter :authenticate

    def index_view

    
    end
    
    def index_data
      get_current_user
      @crops = Crop.where('user_id' => @current_user.id).all
  
    end
    
    def index
      get_current_user
      @crops = Crop.where('user_id' => @current_user.id).all
   
    
      respond_to do |format|                                                     
      format.html  
      format.xml { render :xml => @crop  }
       
      end
    end
    
    def dbaction
  		#called for all db actions
  		cropname = params["c0"]
  		croptype	 = params["c1"]
  		cropspecific	= params["c2"]
  		crop_uom = params["c3"]
  		price_per_uom	 = params["c4"]
  		crop_inventory_uom	= params["c5"]
  		avg_yield_acre = params["c6"]
  		avg_moisture_percent	 = params["c7"]
  		avg_weight_uom	= params["c8"]

  		@mode = params["!nativeeditor_status"]

  		@id = params["gr_id"]
  		case @mode
  			when "inserted"
  				@crop = Crop.new
  				@crop.user_id = session[:s_user_id]
  				@crop.cropname = cropname
  				@crop.croptype = croptype
  				@crop.cropspecific = cropspecific
  				@crop.crop_uom = crop_uom
  				@crop.price_per_uom = price_per_uom
  				@crop.crop_inventory_uom = crop_inventory_uom
  				@crop.avg_moisture_percent = avg_moisture_percent
  				@crop.avg_yield_acre = avg_yield_acre
  				@crop.avg_weight_uom = avg_weight_uom
  				if @crop.save
 
  				else
            flash[:error] = @crop.errors 
            render 'index_view'				  
  				end

  				@tid = @crop.id
  			when "deleted"
  				crop=Crop.find(@id)
  				crop.destroy

  				@tid = @id
  			when "updated"
  				@crop = Crop.find(@id)
  				@crop.cropname = cropname
  				@crop.croptype = croptype
  				@crop.cropspecific = cropspecific
  				@crop.crop_uom = crop_uom
  				@crop.price_per_uom = price_per_uom
  				@crop.crop_inventory_uom = crop_inventory_uom
  				@crop.avg_moisture_percent = avg_moisture_percent
  				@crop.avg_yield_acre = avg_yield_acre
  				@crop.avg_weight_uom = avg_weight_uom
  				if @crop.save
  				   
  				else
    				flash[:error] = @crop.errors 
            render 'index_view' 				  
  				end

  				@tid = @id
  		end 
  	end
   
#-------- Standard ROR scaffold --------------------------------------------

  # GET /crops/1
  # GET /crops/1.xml
  def show
    @crop = Crop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @crop }
    end
  end

  # GET /crops/new
  # GET /crops/new.xml
  def new
    @crop = Crop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @crop }
    end
  end

  # GET /crops/1/edit
  def edit
    @crop = Crop.find(params[:id])
    @onload = 'setUom()'
  end

  # POST /crops
  # POST /crops.xml
  def create
    @crop = Crop.new(params[:crop])
    @crop.user_id = session[:s_user_id]
    respond_to do |format|
      if @crop.save
        
        format.html { redirect_to :action => 'index_view' }
        format.xml  { render :xml => @crop, :status => :created, :location => @crop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @crop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /crops/1
  # PUT /crops/1.xml
  def update
    @crop = Crop.find(params[:id])

    respond_to do |format|
      if @crop.update_attributes(params[:crop])
        format.html { redirect_to :action => "index_view" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @crop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /crops/1
  # DELETE /crops/1.xml
  def destroy
    @crop = Crop.find(params[:id])
    begin
      @crop.destroy 
      rescue ActiveRecord::DeleteRestrictionError => e
      @crop.errors.add(:base, e)
    end 
    respond_to do |format|

        if e.nil?
    
          format.html { redirect_to("/cropview", :notice => 'crop was successfully deleted.') }
          format.xml  { head :ok }
        else          
          format.html { render :action => "edit" }
        end
   
    
    end
  end
  
  def yield_requestor 
    
    
    respond_to do |format|
      format.html

    end
       
  end
  
  def yieldreport
    
 
     #logger.debug "YIELD REPORT  PARAMS- CROP -#{params[:cropplan_id]} FIELD -#{params[:field_id]} "
    respond_to do |format|
      format.html
      format.pdf do
        
        pdf = YieldreportPdf.new(session[:s_user_id], view_context, params[:cropplan_id], params[:field_id],
        params[:start_date], params[:stop_date])
        send_data pdf.render, filename: "yield_report",
                                type: "application/pdf",
                                disposition: "inline"
        
      end
    end
    
    
  end

  
end
