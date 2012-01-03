class FieldtasksController < ApplicationController
  # GET /fieldtasks
  # GET /fieldtasks.xml
  
  before_filter :authenticate

    def index_view

    
    end
    
    def index_data
      get_current_user
      @fieldtasks = Fieldtask.find_by_sql("Select *  
      from fieldtasks 
      where fieldtasks.user_id = #{@current_user.id } 
      order by task_stage desc")
  
    end
 
    
    def dbaction
  		#called for all db actions
  		taskdescription = params["c0"]
  		task_type	 = params["c1"]
  		task_frequency_days	= params["c2"]
  		task_duration_days = params["c3"]
  		task_notes	 = params["c4"]
 

  		@mode = params["!nativeeditor_status"]

  		@id = params["gr_id"]
  		case @mode
  			when "inserted"
 
  			when "deleted"
  				fieldtask=Fieldtask.find(@id)
  				fieldtask.destroy

  				@tid = @id
  			when "updated"
  				@fieldtask = Crop.find(@id)
  				@fieldtask.taskdescription = taskdescription
  				@fieldtask.task_type = task_type
  				@fieldtask.task_frequency_days = task_frequency_days
  				@fieldtask.task_duration_days = task_duration_days
  				@fieldtask.task_notes = task_notes

  	
  				if @fieldtask.save
  				   
  				else
    				flash[:error] = @fieldtask.errors 
            render 'index_view' 				  
  				end

  				@tid = @id
  		end 
  	end
 
 
 # Standard ROR scaffold ------------------------------------------------------------------------
   def index
    get_current_user
    @fieldtasks = Fieldtask.where('user_id' => @current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fieldtasks }
    end
  end
  
  def fieldtask_supplies 
    get_current_user
    @fieldtasksupplies = Fieldtask.select("fieldtasksupplies.id, supplyname, usage_uom, qty_required").joins(:supplies).where('user_id' => @current_user.id , 'id' => session[:s_fieldtask_id]).all
    @fieldtask = Fieldtask.find(session[:s_fieldtask_id])
 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fieldtasks }
    end
  end

  # GET /fieldtasks/1
  # GET /fieldtasks/1.xml
  def show
    @fieldtask = Fieldtask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fieldtask }
    end
  end

  # GET /fieldtasks/new
  # GET /fieldtasks/new.xml
  def new
    @fieldtask = Fieldtask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fieldtask }
    end
  end

  # GET /fieldtasks/1/edit
  def edit
    @fieldtask = Fieldtask.find(params[:id])
    session[:s_fieldtask_id] = @fieldtask.id
  end

  # POST /fieldtasks
  # POST /fieldtasks.xml
  before_filter :authenticate
  def create
    @fieldtask = Fieldtask.new(params[:fieldtask])
    @fieldtask.user_id = session[:s_user_id]
    if @fieldtask.task_frequency_days.nil?
      @fieldtask.task_frequency_days = 0
    end
    if @fieldtask.task_duration_days.nil?
      @fieldtask.task_duration_days = 0
    end
    respond_to do |format|
      
      if @fieldtask.save
        format.html { redirect_to("/fieldtaskview", :notice => 'Fieldtask was successfully created.') }
        format.xml  { render :xml => @fieldtask, :status => :created, :location => @fieldtask }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fieldtask.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fieldtasks/1
  # PUT /fieldtasks/1.xml
  def update
    @fieldtask = Fieldtask.find(params[:id])

    respond_to do |format|
      if @fieldtask.update_attributes(params[:fieldtask])
        format.html { redirect_to("/fieldtaskview", :notice => 'Fieldtask was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fieldtask.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fieldtasks/1
  # DELETE /fieldtasks/1.xml
  def destroy
    @fieldtask = Fieldtask.find(params[:id])
    @fieldtask.destroy

    respond_to do |format|
      format.html { redirect_to(fieldtasks_url) }
      format.xml  { head :ok }
    end
  end
end
