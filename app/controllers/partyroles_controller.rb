class PartyrolesController < ApplicationController
  # GET /partyroles
  # GET /partyroles.xml
  def index
    @partyroles = Partyrole.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partyroles }
    end
  end

  # GET /partyroles/1
  # GET /partyroles/1.xml
  def show
    @partyrole = Partyrole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partyrole }
    end
  end

  # GET /partyroles/new
  # GET /partyroles/new.xml
  def new
    @partyrole = Partyrole.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partyrole }
    end
  end

  # GET /partyroles/1/edit
  def edit
    @partyrole = Partyrole.find(params[:id])
  end

  # POST /partyroles
  # POST /partyroles.xml
  def create
    @partyrole = Partyrole.new(params[:partyrole])

    respond_to do |format|
      if @partyrole.save
        format.html { redirect_to(@partyrole, :notice => 'Partyrole was successfully created.') }
        format.xml  { render :xml => @partyrole, :status => :created, :location => @partyrole }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partyrole.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partyroles/1
  # PUT /partyroles/1.xml
  def update
    @partyrole = Partyrole.find(params[:id])

    respond_to do |format|
      if @partyrole.update_attributes(params[:partyrole])
        format.html { redirect_to(@partyrole, :notice => 'Partyrole was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partyrole.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partyroles/1
  # DELETE /partyroles/1.xml
  def destroy
    @partyrole = Partyrole.find(params[:id])
    @partyrole.destroy

    respond_to do |format|
      format.html { redirect_to(partyroles_url) }
      format.xml  { head :ok }
    end
  end
end
