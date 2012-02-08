class InventoryticketsController < ApplicationController
  # GET /inventorytickets
  # GET /inventorytickets.xml
  def index
    @inventorytickets = Inventoryticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inventorytickets }
    end
  end

  # GET /inventorytickets/1
  # GET /inventorytickets/1.xml
  def show
    @inventoryticket = Inventoryticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inventoryticket }
    end
  end

  # GET /inventorytickets/new
  # GET /inventorytickets/new.xml
  def new
    @inventoryticket = Inventoryticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inventoryticket }
    end
  end

  # GET /inventorytickets/1/edit
  def edit
    @inventoryticket = Inventoryticket.find(params[:id])
  end

  # POST /inventorytickets
  # POST /inventorytickets.xml
  def create
    @inventoryticket = Inventoryticket.new(params[:inventoryticket])

    respond_to do |format|
      if @inventoryticket.save
        format.html { redirect_to(@inventoryticket, :notice => 'Inventoryticket was successfully created.') }
        format.xml  { render :xml => @inventoryticket, :status => :created, :location => @inventoryticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inventoryticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inventorytickets/1
  # PUT /inventorytickets/1.xml
  def update
    @inventoryticket = Inventoryticket.find(params[:id])

    respond_to do |format|
      if @inventoryticket.update_attributes(params[:inventoryticket])
        format.html { redirect_to(@inventoryticket, :notice => 'Inventoryticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inventoryticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inventorytickets/1
  # DELETE /inventorytickets/1.xml
  def destroy
    @inventoryticket = Inventoryticket.find(params[:id])
    @inventoryticket.destroy

    respond_to do |format|
      format.html { redirect_to(inventorytickets_url) }
      format.xml  { head :ok }
    end
  end
end
