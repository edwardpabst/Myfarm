class SupplyinventoryTransController < ApplicationController
  # GET /supplyinventory_trans
  # GET /supplyinventory_trans.xml
  def index
    @supplyinventory_trans = SupplyinventoryTran.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supplyinventory_trans }
    end
  end

  # GET /supplyinventory_trans/1
  # GET /supplyinventory_trans/1.xml
  def show
    @supplyinventory_tran = SupplyinventoryTran.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supplyinventory_tran }
    end
  end

  # GET /supplyinventory_trans/new
  # GET /supplyinventory_trans/new.xml
  def new
    @supplyinventory_tran = SupplyinventoryTran.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supplyinventory_tran }
    end
  end

  # GET /supplyinventory_trans/1/edit
  def edit
    @supplyinventory_tran = SupplyinventoryTran.find(params[:id])
  end

  # POST /supplyinventory_trans
  # POST /supplyinventory_trans.xml
  def create
    @supplyinventory_tran = SupplyinventoryTran.new(params[:supplyinventory_tran])

    respond_to do |format|
      if @supplyinventory_tran.save
        format.html { redirect_to(@supplyinventory_tran, :notice => 'Supplyinventory tran was successfully created.') }
        format.xml  { render :xml => @supplyinventory_tran, :status => :created, :location => @supplyinventory_tran }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supplyinventory_tran.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supplyinventory_trans/1
  # PUT /supplyinventory_trans/1.xml
  def update
    @supplyinventory_tran = SupplyinventoryTran.find(params[:id])

    respond_to do |format|
      if @supplyinventory_tran.update_attributes(params[:supplyinventory_tran])
        format.html { redirect_to(@supplyinventory_tran, :notice => 'Supplyinventory tran was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supplyinventory_tran.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supplyinventory_trans/1
  # DELETE /supplyinventory_trans/1.xml
  def destroy
    @supplyinventory_tran = SupplyinventoryTran.find(params[:id])
    @supplyinventory_tran.destroy

    respond_to do |format|
      format.html { redirect_to(supplyinventory_trans_url) }
      format.xml  { head :ok }
    end
  end
end
