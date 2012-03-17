class CapitalrecoveriesController < ApplicationController
  # GET /capitalrecoveries
  # GET /capitalrecoveries.xml
  def index
    @capitalrecoveries = Capitalrecovery.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @capitalrecoveries }
    end
  end

  # GET /capitalrecoveries/1
  # GET /capitalrecoveries/1.xml
  def show
    @capitalrecovery = Capitalrecovery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @capitalrecovery }
    end
  end

  # GET /capitalrecoveries/new
  # GET /capitalrecoveries/new.xml
  def new
    @capitalrecovery = Capitalrecovery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @capitalrecovery }
    end
  end

  # GET /capitalrecoveries/1/edit
  def edit
    @capitalrecovery = Capitalrecovery.find(params[:id])
  end

  # POST /capitalrecoveries
  # POST /capitalrecoveries.xml
  def create
    @capitalrecovery = Capitalrecovery.new(params[:capitalrecovery])

    respond_to do |format|
      if @capitalrecovery.save
        format.html { redirect_to(@capitalrecovery, :notice => 'Capitalrecovery was successfully created.') }
        format.xml  { render :xml => @capitalrecovery, :status => :created, :location => @capitalrecovery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @capitalrecovery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /capitalrecoveries/1
  # PUT /capitalrecoveries/1.xml
  def update
    @capitalrecovery = Capitalrecovery.find(params[:id])

    respond_to do |format|
      if @capitalrecovery.update_attributes(params[:capitalrecovery])
        format.html { redirect_to(@capitalrecovery, :notice => 'Capitalrecovery was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @capitalrecovery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /capitalrecoveries/1
  # DELETE /capitalrecoveries/1.xml
  def destroy
    @capitalrecovery = Capitalrecovery.find(params[:id])
    @capitalrecovery.destroy

    respond_to do |format|
      format.html { redirect_to(capitalrecoveries_url) }
      format.xml  { head :ok }
    end
  end
end
