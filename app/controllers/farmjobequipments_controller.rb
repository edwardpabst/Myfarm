class FarmjobequipmentsController < ApplicationController
  # GET /farmjobequipments
  # GET /farmjobequipments.xml
  before_filter :authenticate
  def index
    @farmjobequipments = Farmjobequipment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @farmjobequipments }
    end
  end

  # GET /farmjobequipments/1
  # GET /farmjobequipments/1.xml
  def show
    @farmjobequipment = Farmjobequipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @farmjobequipment }
    end
  end

  # GET /farmjobequipments/new
  # GET /farmjobequipments/new.xml
  def new
    @farmjobequipment = Farmjobequipment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farmjobequipment }
    end
  end

  # GET /farmjobequipments/1/edit
  def edit
    @farmjobequipment = Farmjobequipment.find(params[:id])
  end

  # POST /farmjobequipments
  # POST /farmjobequipments.xml
  def create
    @farmjobequipment = Farmjobequipment.new(params[:farmjobequipment])
    @farmjobequipment.user_id = session[:s_user_id]
    @farmjobequipment.farmjob_id = session[:s_farmjob_id]
    @farmjobequipment.qty_required = 0
    @equipment = Equipment.find(@farmjobequipment.equipment_id)
    #if @farmjobequipment.qty_actual.nil? || @farmjoblabor.qty_actual.blank? || @farmjoblabor.qty_actual == 0
    if params[:farmjobequipment][:qty_actual].nil? || params[:farmjobequipment][:qty_actual].blank? || params[:farmjobequipment][:qty_actual] == 0  
      @farmjob = Farmjob.find(@farmjobequipment.farmjob_id)
      @farmjobequipment.qty_required = @farmjob.total_hours
      @farmjobequipment.qty_actual = @farmjob.total_hours
    end
    if @farmjobequipment.cost_unit_hour.nil? || @farmjobequipment.cost_unit_hour.empty? 
      @farmjobequipment.cost_unit_hour = @equipment.cost_unit_hour
    end
    if @farmjobequipment.rate_hour.nil? || @farmjobequipment.rate_hour.empty? 
      @farmjobequipment.rate_hour = @equipment.rate_per_hour
    end
    respond_to do |format|
      if @farmjobequipment.save
        if !@equipment.supply_id.nil? and !@equipment.supply_id.blank?
          @usage_qty = @equipment.usage_qty_hour *  @farmjobequipment.qty_required
         @farmjobsupply_id = Farmjobsupply.add_fuel_supply(@equipment.user_id, @farmjobequipment.farmjob_id, @equipment.supply_id, @usage_qty)
         @farmjobequipment = Farmjobequipment.find(@farmjobequipment.id)
         @farmjobequipment.farmjobsupply_id = @farmjobsupply_id 
         @farmjobequipment.save
        end
       format.html  { redirect_to(:controller => "farmjobs",  :action => "edit", :id => session[:s_farmjob_id] ) }
        format.xml  { render :xml => @farmjobsupply, :status => :created, :location => @farmjobsupply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @farmjobsupply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farmjobequipments/1
  # PUT /farmjobequipments/1.xml
  def update
    @farmjobequipment = Farmjobequipment.find(params[:id])

    respond_to do |format|
      if @farmjobequipment.update_attributes(params[:farmjobequipment])
        format.html { redirect_to(@farmjobequipment, :notice => 'Farmjobequipment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @farmjobequipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /farmjobequipments/1
  # DELETE /farmjobequipments/1.xml
  def destroy
    @farmjobequipment = Farmjobequipment.find(params[:id])
    @farmjobequipment.destroy

    respond_to do |format|
      format.html { redirect_to(farmjobequipments_url) }
      format.xml  { head :ok }
    end
  end
end
