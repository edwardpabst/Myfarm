class ZtimesController < ApplicationController
  # GET /ztimes
  # GET /ztimes.xml
  def index
    @ztimes = Ztime.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ztimes }
    end
  end

  # GET /ztimes/1
  # GET /ztimes/1.xml
  def show
    @ztime = Ztime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ztime }
    end
  end

  # GET /ztimes/new
  # GET /ztimes/new.xml
  def new
    @ztime = Ztime.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ztime }
    end
  end

  # GET /ztimes/1/edit
  def edit
    @ztime = Ztime.find(params[:id])
  end

  # POST /ztimes
  # POST /ztimes.xml
  def create
    @ztime = Ztime.new(params[:ztime])

    respond_to do |format|
      if @ztime.save
        format.html { redirect_to("/ztimes", :notice => 'Ztime was successfully created.') }
        format.xml  { render :xml => @ztime, :status => :created, :location => @ztime }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ztime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ztimes/1
  # PUT /ztimes/1.xml
  def update
    @ztime = Ztime.find(params[:id])

    respond_to do |format|
      if @ztime.update_attributes(params[:ztime])
        format.html { redirect_to("/ztimes", :notice => 'Ztime was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ztime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ztimes/1
  # DELETE /ztimes/1.xml
  def destroy
    @ztime = Ztime.find(params[:id])
    @ztime.destroy

    respond_to do |format|
      format.html { redirect_to(ztimes_url) }
      format.xml  { head :ok }
    end
  end
end
