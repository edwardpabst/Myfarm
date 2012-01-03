class FarmjoblaborsController < ApplicationController
  # GET /farmjoblabors
  # GET /farmjoblabors.xml
  before_filter :authenticate
  def index
    @farmjoblabors = Farmjoblabor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @farmjoblabors }
    end
  end

  # GET /farmjoblabors/1
  # GET /farmjoblabors/1.xml
  def show
    @farmjoblabor = Farmjoblabor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @farmjoblabor }
    end
  end

  # GET /farmjoblabors/new
  # GET /farmjoblabors/new.xml
  def new
    @farmjoblabor = Farmjoblabor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farmjoblabor }
    end
  end

  # GET /farmjoblabors/1/edit
  def edit
    @farmjoblabor = Farmjoblabor.find(params[:id])
  end

  # POST /farmjoblabors
  # POST /farmjoblabors.xml
  def create
    @farmjoblabor = Farmjoblabor.new(params[:farmjoblabor])
    @farmjoblabor.user_id = session[:s_user_id]
    @farmjoblabor.farmjob_id = session[:s_farmjob_id]
    
    if @farmjoblabor.task_hours.nil? || @farmjoblabor.task_hours.blank? || @farmjoblabor.task_hours == 0
      @farmjob = Farmjob.find(@farmjoblabor.farmjob_id)
      @farmjoblabor.task_hours = @farmjob.total_hours
    end 
    
    if @farmjoblabor.rate.nil? || @farmjoblabor.rate.blank? || @farmjoblabor.rate == 0
      @party = Party.find(@farmjoblabor.party_id)
      @farmjoblabor.rate = @party.rate_hour
    end
 
    respond_to do |format|
      if @farmjoblabor.save
        format.html  { redirect_to(:controller => "farmjobs",  :action => "edit", :id => session[:s_farmjob_id] ) }
        format.xml  { render :xml => @farmjob, :status => :created, :location => @farmjob }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @farmjoblabor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farmjoblabors/1
  # PUT /farmjoblabors/1.xml
  def update
    @farmjoblabor = Farmjoblabor.find(params[:id])

    respond_to do |format|
      if @farmjoblabor.update_attributes(params[:farmjoblabor])
        format.html { redirect_to(@farmjoblabor, :notice => 'Farmjoblabor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @farmjoblabor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /farmjoblabors/1
  # DELETE /farmjoblabors/1.xml
  def destroy
    @farmjoblabor = Farmjoblabor.find(params[:id])
    @farmjoblabor.destroy

    respond_to do |format|
      format.html { redirect_to(farmjoblabors_url) }
      format.xml  { head :ok }
    end
  end
end
