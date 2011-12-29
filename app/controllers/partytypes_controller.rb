class PartytypesController < ApplicationController
  # GET /partytypes
  # GET /partytypes.xml
  before_filter :authenticate
  
  def index
    @partytypes = Partytype.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partytypes }
    end
  end

  # GET /partytypes/1
  # GET /partytypes/1.xml
  def show
    @partytype = Partytype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partytype }
    end
  end

  # GET /partytypes/new
  # GET /partytypes/new.xml
  def new
    @partytype = Partytype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partytype }
    end
  end

  # GET /partytypes/1/edit
  def edit
    @partytype = Partytype.find(params[:id])
  end

  # POST /partytypes
  # POST /partytypes.xml
  def create
    @partytype = Partytype.new(params[:partytype])

    respond_to do |format|
      if @partytype.save
        format.html { redirect_to(@partytype, :notice => 'Partytype was successfully created.') }
        format.xml  { render :xml => @partytype, :status => :created, :location => @partytype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partytype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partytypes/1
  # PUT /partytypes/1.xml
  def update
    @partytype = Partytype.find(params[:id])

    respond_to do |format|
      if @partytype.update_attributes(params[:partytype])
        format.html { redirect_to(@partytype, :notice => 'Partytype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partytype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partytypes/1
  # DELETE /partytypes/1.xml
  def destroy
    @partytype = Partytype.find(params[:id])
    @partytype.destroy

    respond_to do |format|
      format.html { redirect_to(partytypes_url) }
      format.xml  { head :ok }
    end
  end
end
