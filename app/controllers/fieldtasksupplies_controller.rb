class FieldtasksuppliesController < ApplicationController
  # GET /fieldtasksupplies
  # GET /fieldtasksupplies.xml
  
  before_filter :authenticate

    def index_view

    
    end
    
    def index_data
      get_current_user
      @fieldtasksupplies = Fieldtask.find_by_sql("Select fieldtasksupplies.id, supplyname, supply_type,
      qty_required, usage_uom
      from fieldtasksupplies  
      join supplies on fieldtasksupplies.supply_id  = supplies.id

      where fieldtasksupplies .user_id = #{@current_user.id } and fieldtasksupplies.fieldtask_id = #{session[:s_fieldtask_id] }")
    end
 
    
    def index_dbaction
  		#called for all db actions
  		supplyname = params["c0"]
  		supply_type	 = params["c1"]
  		qty_required	= params["c2"]
  		usage_uom = params["c3"]
  
 

  		@mode = params["!nativeeditor_status"]

  		@id = params["gr_id"]
  		case @mode
  			when "inserted"
 
  			when "deleted"
  				@fieldtasksupply = Fieldtasksupply.find(@id)
  				@fieldtasksupply.destroy

  				@tid = @id
  			when "updated"
  				@fieldtasksupply = Fieldtasksupply.find(@id)
  				@fieldtasksupply.qty_required = qty_required


  	
  				if @fieldtasksupply.save
  				   
  				else
    				flash[:error] = @fieldtasksupply.errors 
            render 'index_view' 				  
  				end

  				@tid = @id
  		end 
  	end
  #--- Standard ROR scaffold ---------------------------------------------------------------------
  
  def index
    @fieldtasksupplies = Fieldtasksupply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fieldtasksupplies }
    end
  end

  # GET /fieldtasksupplies/1
  # GET /fieldtasksupplies/1.xml
  def show
    @fieldtasksupply = Fieldtasksupply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fieldtasksupply }
    end
  end

  # GET /fieldtasksupplies/new
  # GET /fieldtasksupplies/new.xml
  def new
    @fieldtasksupply = Fieldtasksupply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fieldtasksupply }
    end
  end

  # GET /fieldtasksupplies/1/edit
  def edit
    @fieldtasksupply = Fieldtasksupply.find(params[:id])
  end

 
  
  def create
    @fieldtasksupply = Fieldtasksupply.new(params[:fieldtasksupply])
    @fieldtasksupply.fieldtask_id = session[:s_fieldtask_id]
    @fieldtasksupply.user_id = session[:s_user_id]
    @supply = Supply.find(@fieldtasksupply.supply_id)
    @fieldtasksupply.usage_uom = @supply.distribution_uom
    @fieldtasksupply.qty_required = @supply.rate_acre
      
    

    respond_to do |format|
      if @fieldtasksupply.save
        format.html { redirect_to( :controller => "fieldtasks",  :action => "edit", :id => session[:s_fieldtask_id] , :notice => 'Supply was successfully created.') }
        format.xml  { render :xml => fieldtasks, :status => :created, :location => @fieldtasksupply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fieldtasksupply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fieldtasksupplies/1
  # PUT /fieldtasksupplies/1.xml
  def update
    @fieldtasksupply = Fieldtasksupply.find(params[:id])

    respond_to do |format|
      if @fieldtasksupply.update_attributes(params[:fieldtasksupply])
        format.html { redirect_to(:controller => "fieldtasks",  :action => "edit", :id => session[:s_fieldtask_id] , :notice => 'Supply was successfully created.') }        
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fieldtasksupply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fieldtasksupplies/1
  # DELETE /fieldtasksupplies/1.xml
  def destroy
    @fieldtasksupply = Fieldtasksupply.find(params[:id])
    @fieldtasksupply.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "fieldtasks", :action => "fieldtask_supplies", :id => session[:s_fieldtask_id]) }
      format.xml  { head :ok }
    end
  end
end
