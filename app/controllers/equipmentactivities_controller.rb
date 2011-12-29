class EquipmentactivitiesController < ApplicationController
  # GET /equipmentactivities
  # GET /equipmentactivities.xml
  def index
    @equipmentactivities = Equipmentactivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipmentactivities }
    end
  end

  # GET /equipmentactivities/1
  # GET /equipmentactivities/1.xml
  def show
    @equipmentactivity = Equipmentactivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipmentactivity }
    end
  end

  # GET /equipmentactivities/new
  # GET /equipmentactivities/new.xml
  def new
    @equipmentactivity = Equipmentactivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipmentactivity }
    end
  end

  # GET /equipmentactivities/1/edit
  def edit
    @equipmentactivity = Equipmentactivity.find(params[:id])
  end

  # POST /equipmentactivities
  # POST /equipmentactivities.xml
  def create
    @equipmentactivity = Equipmentactivity.new(params[:equipmentactivity])

    respond_to do |format|
      if @equipmentactivity.save
        format.html { redirect_to(@equipmentactivity, :notice => 'Equipmentactivity was successfully created.') }
        format.xml  { render :xml => @equipmentactivity, :status => :created, :location => @equipmentactivity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipmentactivity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipmentactivities/1
  # PUT /equipmentactivities/1.xml
  def update
    @equipmentactivity = Equipmentactivity.find(params[:id])

    respond_to do |format|
      if @equipmentactivity.update_attributes(params[:equipmentactivity])
        format.html { redirect_to(@equipmentactivity, :notice => 'Equipmentactivity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipmentactivity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipmentactivities/1
  # DELETE /equipmentactivities/1.xml
  def destroy
    @equipmentactivity = Equipmentactivity.find(params[:id])
    @equipmentactivity.destroy

    respond_to do |format|
      format.html { redirect_to(equipmentactivities_url) }
      format.xml  { head :ok }
    end
  end
end
