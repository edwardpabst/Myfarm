class FarmjobsuppliesController < ApplicationController
  # GET /farmjobsupplies
  # GET /farmjobsupplies.xml
  def index
    @farmjobsupplies = Farmjobsupply.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @farmjobsupplies }
    end
  end

  # GET /farmjobsupplies/1
  # GET /farmjobsupplies/1.xml
  def show
    @farmjobsupply = Farmjobsupply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @farmjobsupply }
    end
  end

  # GET /farmjobsupplies/new
  # GET /farmjobsupplies/new.xml
  def new
    @farmjobsupply = Farmjobsupply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farmjobsupply }
    end
  end

  # GET /farmjobsupplies/1/edit
  def edit
    @farmjobsupply = Farmjobsupply.find(params[:id])
  end

  # POST /farmjobsupplies
  # POST /farmjobsupplies.xml
  before_filter :authenticate
  def create
    @farmjobsupply = Farmjobsupply.new(params[:farmjobsupply])
    @farmjobsupply.user_id = session[:s_user_id]
    @farmjobsupply.farmjob_id = session[:s_farmjob_id]
    @supply = Supply.find(@farmjobsupply.supply_id)
    @farmjobsupply.usage_uom = @supply.distribution_uom
    if @farmjobsupply.actual_qty.nil? || @farmjobsupply.actual_qty.blank? || @farmjobsupply.actual_qty == 0
      @farmjob = Farmjob.find(session[:s_farmjob_id])
      rate_per_acre = @supply.rate_acre
      @farmjobsupply.actual_qty = rate_per_acre * @farmjob.area_size
    end
    
    respond_to do |format|
      if @farmjobsupply.save
       format.html  { redirect_to(:controller => "farmjobs",  :action => "edit", :id => session[:s_farmjob_id] ) }
        format.xml  { render :xml => @farmjobsupply, :status => :created, :location => @farmjobsupply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @farmjobsupply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farmjobsupplies/1
  # PUT /farmjobsupplies/1.xml
  def update
    @farmjobsupply = Farmjobsupply.find(params[:id])

    respond_to do |format|
      if @farmjobsupply.update_attributes(params[:farmjobsupply])
        format.html { redirect_to(@farmjobsupply, :notice => 'Farmjobsupply was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @farmjobsupply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /farmjobsupplies/1
  # DELETE /farmjobsupplies/1.xml
  def destroy
    @farmjobsupply = Farmjobsupply.find(params[:id])
    @farmjobsupply.destroy

    respond_to do |format|
      format.html { redirect_to(farmjobsupplies_url) }
      format.xml  { head :ok }
    end
  end
end
