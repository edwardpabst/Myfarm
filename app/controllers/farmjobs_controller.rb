class FarmjobsController < ApplicationController
  # GET /farmjobs
  # GET /farmjobs.xml
  
  before_filter :authenticate
  require "simple_time_select"
  
  #-------farmjob index----------------------------------------------------------------------------
      def index_view
        session[:return_to] = "/farmjobview"
      
      end

      def index_data

        get_current_user

        @farmjobs = Farmjob.find_by_sql("Select farmjobs.id, fieldname, cropplanfull, plan_year, 
        taskdescription, job_status, start_date, stop_date, area_size, total_cost 
        from farmjobs  
        join cropplans on farmjobs.cropplan_id = cropplans.id
        join crops on cropplans.crop_id = crops.id  
        join fields on farmjobs.field_id = fields.id 
        join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
        where farmjobs.user_id = #{@current_user.id } 
        order by start_date")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		taskdescription = params["c0"]
    		fieldname	 = params["c1"]
    		cropplanfull	= params["c2"]
    		job_status = params["c3"]
    		start_date = params["c4"]
    		stop_date = params["c5"]
    		area_size = params["c6"]

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@farmjob = Farmjob.find(@id)
    				@farmjob.destroy
    				#update event calendar
            @event = Event.find_by_farmjob_id(@id)
            if !@event.nil?
              @event.destroy
            end

    				@tid = @id
    			when "updated"
    				@farmjob = Farmjob.find(@id)
    				@farmjob.area_size = area_size
    	


    				if @farmjob.save

    				else
      				flash[:error] = @farmjob.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end  
  
#-------farmjoblabor----------------------------------------------------------------------------
    def parties_view

    
    end
    
    def parties_data

      @farmjoblabors = Farmjob.find_by_sql(" Select farmjoblabors.id, partyname, partyjobtitle, task_hours, rate
      from farmjobs  
      join farmjoblabors on farmjobs.id = farmjoblabors.farmjob_id
      join parties on farmjoblabors.party_id = parties.id 
      where farmjobs.id = #{session[:s_farmjob_id]}")
      
      #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
     # logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"
  
    end
    
    def labor_dbaction
  		#called for all db actions
  		partyname = params["c0"]
  		partyjobtitle	 = params["c1"]
  		task_hours	= params["c2"]
  		rate = params["c3"]

  		@mode = params["!nativeeditor_status"]

  		@id = params["gr_id"]
  		case @mode

  			when "deleted"
  				@farmjoblabor = Farmjoblabor.find(@id)
  				@farmjoblabor.destroy

  				@tid = @id
  			when "updated"
  				@farmjoblabor = Farmjoblabor.find(@id)
  				@farmjoblabor.task_hours = task_hours
  				@farmjoblabor.rate = rate


  				if @farmjoblabor.save
  				   
  				else
    				flash[:error] = @farmjoblabor.errors 
            render 'index_view' 				  
  				end

  				@tid = @id
  		end 
  	end
#-------farmjobsupply----------------------------------------------------------------------------
        def supplies_view


        end

        def supplies_data

          @farmjobsupplies = Farmjob.find_by_sql(" Select farmjobsupplies.id, supplyname, actual_qty, usage_uom
          from farmjobs  
          join farmjobsupplies on farmjobs.id = farmjobsupplies.farmjob_id
          join supplies on farmjobsupplies.supply_id = supplies.id 
          where farmjobs.id = #{session[:s_farmjob_id]}")

          #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
          #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

        end

        def supplies_dbaction
      		#called for all db actions
      		supplyname = params["c0"]
      		actual_qty	 = params["c1"]
      		usage_uom	= params["c2"]
      	

      		@mode = params["!nativeeditor_status"]

      		@id = params["gr_id"]
      		case @mode

      			when "deleted"
      				@farmjobsupply = Farmjobsupply.find(@id)
      				@farmjobsupply.destroy

      				@tid = @id
      			when "updated"
      				@farmjobsupply = Farmjobsupply.find(@id)
      				@farmjobsupply.actual_qty = actual_qty
      				#@farmjobsupply.usage_uom = usage_uom


      				if @farmjobsupply.save

      				else
        				flash[:error] = @farmjobsupply.errors 
                render 'index_view' 				  
      				end

      				@tid = @id
      		end 
      	end
#-------farmjobequipment----------------------------------------------------------------------------
            def equipment_view


            end

            def equipment_data

              @farmjobequipments = Farmjob.find_by_sql(" Select farmjobequipments.id, farmjobequipments.farmjob_id, description, qty_actual, farmjobequipments.cost_unit_hour, farmjobequipments.additional_cost, farmjobequipments.rate_hour
              from farmjobs  
              join farmjobequipments on farmjobs.id = farmjobequipments.farmjob_id
              join equipment on farmjobequipments.equipment_id = equipment.id 
              where farmjobs.id = #{session[:s_farmjob_id]}")

              #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
              #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

            end

            def equipment_dbaction
          		#called for all db actions
          		description = params["c0"]
          		qty_actual	 = params["c1"]
          		cost_unit_hour	= params["c2"]
          		rate_hour = params["c3"]

          		@mode = params["!nativeeditor_status"]

          		@id = params["gr_id"]
          		case @mode

          			when "deleted"
          				@farmjobequipment = Farmjobequipment.find(@id)
          				@farmjobequipment.destroy


          				@tid = @id
          			when "updated"
          				@farmjobequipment = Farmjobequipment.find(@id)
          				@farmjobequipment.qty_actual = qty_actual
          				@farmjobequipment.cost_unit_hour = cost_unit_hour
          				@farmjobequipment.rate_hour = rate_hour


          				if @farmjobequipment.save

          				else
            				flash[:error] = @farmjobequipment.errors 
                    render 'index_view' 				  
          				end

          				@tid = @id
          		end 
          	end
  #----------- Standard ROR scaffold ----------------------------------------------
  def index
    get_current_user
  
   @farmjobs = Farmjob.find_by_sql("Select farmjobs.id, fieldname, cropplanfull, plan_year, taskdescription, job_status, start_date, stop_date, area_size 
  from farmjobs  
  join cropplans on farmjobs.cropplan_id = cropplans.id
  join crops on cropplans.crop_id = crops.id  
  join fields on farmjobs.field_id = fields.id 
  join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
  where farmjobs.user_id = #{@current_user.id } ")

    #@farmjobs = Farmjob.select("fieldname, cropname, taskdescription, job_status, start_date, stop_date, area_size").joins(:Field, :Crop, :Fieldtask).where('user_id' == #@current_user.id).all 
            
   # @farmjobs = Farmjob.find(:all, :joins => [:Crop, :Field, :Fieldtask]).select("fieldname, cropname, taskdescription, job_status, start_date, stop_date", #"area_size").where('user_id' == @current_user.id)
 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @farmjobs }
    end
  end

  # GET /farmjobs/1
  # GET /farmjobs/1.xml
  def show
    @farmjob = Farmjob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @farmjob }
    end
  end

  # GET /farmjobs/new
  # GET /farmjobs/new.xml
  def new
    @farmjob = Farmjob.new
    @transaction = 'new'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farmjob }
    end
  end

  # GET /farmjobs/1/edit
  
  def edit
    Farmjob.calculate_job_cost(params[:id])
    @farmjob = Farmjob.find(params[:id])
    session[:s_farmjob_id] = @farmjob.id
    @onload = 'checkFarmjob()'
    @transaction = 'edit'
     

   # logger.debug "FARMJOBSUPPLIES #{@farmjobsupplies.size}" 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farmjob }
    end
  end

  # POST /farmjobs
  # POST /farmjobs.xml
  def create
    # extract time
    #params[:farmjob][:start_time] = (Time.parse(params[:farmjob][:"start_time(5i)"]))
    #params[:farmjob].delete(:"start_time(i)")
    #params[:farmjob][:stop_time] = (Time.parse(params[:farmjob][:"stop_time(5i)"]))
    #params[:farmjob].delete(:"stop_time(i)")
    #params[:farmjob].delete(:"start_time(i)")
    
    #get dependant info
    @farmjob = Farmjob.new(params[:farmjob])
    @farmjob.user_id = session[:s_user_id]
    @cropplan = Cropplan.find_by_id(@farmjob.cropplan_id)
    if !@cropplan.nil?
      @farmjob.crop_id = @cropplan.crop_id
  end
    @fieldtask = Fieldtask.find_by_id(@farmjob.fieldtask_id)
    if @farmjob.notes.blank?
      if !@fieldtask.nil?
        @farmjob.notes = @fieldtask.task_notes
      end
    end
    
    #fill event with task description if blank
    if  params[:farmjob][:eventname].blank? || params[:farmjob][:eventname].nil? 
      if @farmjob.notes.blank?
         if !@fieldtask.nil?
           @farmjob.eventname = @fieldtask.taskdescription
         end
      end
    end
    # set crop in farmjob from crop plan
    if !@cropplan.nil?
      params[:farmjob][:crop_id] = @cropplan.crop_id
    end
    @farmjob.has_been_completed = false
    @farmjob.supply_cost = 0
    @farmjob.labor_cost = 0
    @farmjob.equipment_cost = 0
    
    
    #time handler  

     #@farmjob.start_time = params[:farmjob][:"start_time"] 
    # @farmjob.stop_time = params[:stop_time][:"time(i)"]
      
    respond_to do |format|
      if @farmjob.save
        @save_id = @farmjob.id

        #write calendar event for the job
        post_event
      
        # if task supplies exist then write them to the job supplies
        attach_supplies       
        
        # if frequency defined for the task then generate additional duplicate tasks
        
        if @farmjob.isreplicate?
            replicate_farmjob           
        end

        flash[:notice] = 'Farmjob was successfully created. You can now add supplies, labor and equipment.'
        format.html { redirect_to(:controller => :farmjobs, :action => :edit, :id => @save_id, 	:notice => 'Farmjob was successfully created. You can now add supplies, labor and equipment.') }
        format.xml  { render :xml => @farmjob, :status => :created, :location => @farmjob }
      else
         
        format.html { render :action => "new" }
        
        format.xml  { render :xml => @farmjob.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farmjobs/1
  # PUT /farmjobs/1.xml
  def update
     # logger.debug "PARAMS #{params[:farmjob].inspect}" 
     #params[:farmjob][:start_time] = (Time.parse(params[:farmjob][:"start_time(5i)"]))
     #params[:farmjob].delete(:"start_time(i)")
     #params[:farmjob][:stop_time] = (Time.parse(params[:farmjob][:"stop_time(5i)"]))
     #params[:farmjob].delete(:"stop_time(i)")
    @farmjob = Farmjob.find(params[:id])
    @cropplan = Cropplan.find_by_id(@farmjob.cropplan_id)
    @field = Field.select("fieldname").find(@farmjob.field_id)
    @fieldtask = Fieldtask.find_by_id(@farmjob.fieldtask_id)
    if @farmjob.notes.blank?
        @farmjob.notes = @fieldtask.task_notes
    end
    
    @is_first_time = false
     #logger.debug "FARMJOB INVENTORY STEP 1 **** #{params[:farmjob][:job_status]}, #{@farmjob.job_status}"
    if params[:farmjob][:job_status] == "Job complete" and @farmjob.job_status != "Job complete"
      @farmjob.has_been_completed = true
      @is_first_time = true
       
    end
 
    if  params[:farmjob][:eventname].blank? || params[:farmjob][:eventname].nil? 
     params[:farmjob][:eventname] = @fieldtask.taskdescription
    end 
    
    params[:farmjob][:crop_id] = @cropplan.crop_id   
     
  
    
    respond_to do |format|
      if @farmjob.update_attributes(params[:farmjob])
        
       # build job cost 
       Farmjob.calculate_job_cost(@farmjob.id)
       
       #decrement supplies inventory, close job
        if @is_first_time == true
          #logger.debug "FARMJOB INVENTORY STEP 3 **** "
          Farmjobsupply.decrement_supply_inventory(@farmjob.id)
        end
        
        #update event calendar
        @event = Event.find_by_farmjob_id(@farmjob.id)
        if !@event.nil?
          @event.name = @farmjob.eventname + "/" + @field.fieldname + "/" + @cropplan.cropplanfull
          @event.notes = @farmjob.notes
          @event.start_at = @farmjob.start_date 
          @event.end_at = @farmjob.stop_date 
          @event.farmjob_id = @farmjob.id
         #set cell colors
            @colors = serve_colors
            @colors.each do|key,value|
              if key.downcase  == @farmjob.job_status.downcase 
                @event.color = value
              end 
            end   #end colors
      
 
            if @event.save 
            
            else
              format.html { redirect_to(:controller => :farmjobs, :action => :edit, :id => @farmjob.id, 	:notice => 'Farmjob was successfully created. But, corresponding event was not.') }
              format.xml  { head :ok }
            end  #end save
          end  #end nil
      
        format.html { redirect_to(:controller => :farmjobs, :action => :edit, :id => @farmjob.id, 	:notice => 'Farmjob was successfully updated.') }
        format.xml  { head :ok }
        
      else
         
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @farmjob.errors, :status => :unprocessable_entity }
      end      
     
    end  #end respond to
  end  #end update
 

  # DELETE /farmjobs/1
  # DELETE /farmjobs/1.xml
  def destroy
    @farmjob = Farmjob.find(params[:id])
    @farmjob.destroy
    
    @event = Event.find_by_farmjob_id(params[:id])
    if !@event.nil?
      @event.destroy
    end
    respond_to do |format|
      format.html { redirect_to("/farmjobview") }
      format.xml  { head :ok }
    end
  end
  

  
  def replicate_farmjob 
     original_id = @farmjob.id
     original_startdate = @farmjob.start_date
     @running_days = 0
     @fieldtask = Fieldtask.find(@farmjob.fieldtask_id)
     taskduration = 0
     taskduration = @fieldtask.task_duration_days
     if @fieldtask.task_frequency_days.nil?
       @fieldtask.task_frequency_days = 0
     end 
  
     if @fieldtask.task_frequency_days > 0
     
          while taskduration > 0
           
            @ufarmjob = @farmjob
            @running_days += @fieldtask.task_frequency_days 
            @ufarmjob.start_date = original_startdate +  @running_days
            taskduration -= @fieldtask.task_frequency_days
            #logger.debug "START DATE TIME Ufarmjob after- #{@ufarmjob.inspect}"
            @farmjob = Farmjob.new
            @farmjob.user_id = @ufarmjob.user_id
            @farmjob.fieldtask_id = @ufarmjob.fieldtask_id 
            @farmjob.field_id = @ufarmjob.field_id
            @farmjob.crop_id = @ufarmjob.crop_id
            @farmjob.cropplan_id = @ufarmjob.cropplan_id
            @farmjob.job_status = @ufarmjob.job_status
            @farmjob.area_size = @ufarmjob.area_size
            @farmjob.total_hours = @ufarmjob.total_hours
            @farmjob.notes = @ufarmjob.notes
            @farmjob.eventname = @ufarmjob.eventname
            @farmjob.equipment_id = @ufarmjob.equipment_id
            @farmjob.applied_area = @ufarmjob.applied_area
            @farmjob.plan_rate = @ufarmjob.plan_rate
            @farmjob.actual_rate = @ufarmjob.actual_rate
            @farmjob.growth_stage = @ufarmjob.growth_stage
            @farmjob.application_method = @ufarmjob.application_method
            @farmjob.soil_condition = @ufarmjob.soil_condition
            @farmjob.soil_type = @ufarmjob.soil_type
            @farmjob.weather_segment = @ufarmjob.weather_segment
            @farmjob.start_date = @ufarmjob.start_date
            @farmjob.stop_date = @ufarmjob.start_date
            @farmjob.start_time = @ufarmjob.start_time
            @farmjob.stop_time = @ufarmjob.stop_time
            @farmjob.isreplicate = @ufarmjob.isreplicate
            @farmjob.from_farmjob_id = original_id
            @farmjob.has_been_completed = false

 
                if @farmjob.save
                 
                  attach_supplies
                  post_event
                  Farmjob.calculate_job_cost(@farmjob.id)

                else
                  @iserror = true
 
                end
            
              
      		end  
        end

  end
  
  def attach_supplies 
    
    # if task supplies exist then write them to the job supplies
    
    @tasksupplies = Fieldtask.get_supplies_by_fieldtask_id(@farmjob.fieldtask_id)
     
    @tasksupplies.each do |ts|  
      @farmjobsupply = Farmjobsupply.new
      @farmjobsupply.farmjob_id = @farmjob.id
      @farmjobsupply.user_id = @farmjob.user_id
      @farmjobsupply.supply_id = ts.supply_id
      @farmjobsupply.actual_qty = ts.qty_required
      @farmjobsupply.usage_uom = ts.usage_uom 
      
      @supply = Supply.find(ts.supply_id)
      if @farmjobsupply.actual_qty.nil? || @farmjobsupply.actual_qty.blank? || @farmjobsupply.actual_qty == 0      
        rate_per_acre = @supply.rate_acre
      else
        rate_per_acre = @farmjobsupply.actual_qty
      end
      @farmjobsupply.actual_qty = rate_per_acre * @farmjob.area_size
      
      @farmjobsupply.save
    end
  end
  
  def post_event()
    @field = Field.select("fieldname").find(@farmjob.field_id)
    @cropplan = Cropplan.select("cropplanfull").find(@farmjob.cropplan_id)
    @event = Event.new 
    @event.user_id = @farmjob.user_id
    @event.name = @farmjob.eventname.to_s + "/" + @field.fieldname.to_s + "/" + @cropplan.cropplanfull.to_s
    @event.notes = @farmjob.notes
    @event.start_at = @farmjob.start_date   #+  @farmjob.start_time
    @event.end_at = @farmjob.stop_date    #+ @farmjob.stop_time
    @event.farmjob_id = @farmjob.id
    #set cell colors
    @event.color = "blue"
       @colors = serve_colors
       @colors.each do|key,value|
         if key == @farmjob.job_status     
           @event.color = value
         end 
       end   #end colors
    if @event.save
      
    else
      format.html { redirect_to(:controller => :farmjobs, :action => :edit, :id => @save_id, :notice => 'Farmjob was created but corresponding event was not.') }
      format.xml  { render :xml => @farmjob, :status => :created, :location => @farmjob }
    end
  end
  
  def serve_colors
    colors = {}

    colors["Plan"] = "blue"
    colors["In process"] = "green"
    colors["Job complete"] = "red"
  
    return colors
    
  end
  

  def farmjob_report_requestor 
    
   @farmjob = Farmjob.new
    
    respond_to do |format|
      format.html

    end
       
  end
  
  def farmjobreport
    
   #logger.debug "FARMJOB REQUEST PARAMS- #{params[:job_status]}"
    
    respond_to do |format|
      format.html
      format.pdf do
        
        pdf = FarmjobfieldreportPdf.new(session[:s_user_id], view_context,params[:fieldtask_id], params[:field_id], 
        params[:cropplan_id], params[:start_date], params[:job_status], params[:stop_date], params[:sort_sequence])
        send_data pdf.render, filename: "farmjob_report",
                                type: "application/pdf",
                                disposition: "inline"
        
      end
    end
    
    
  end
  
  
  def profitability_report_requestor 
    
   @farmjob = Farmjob.new
    
    respond_to do |format|
      format.html

    end
       
  end
  
  def profitabilityjobreport
    
   #logger.debug "FARMJOB REQUEST PARAMS- #{params[:report_version]}"
    
    respond_to do |format|
      format.html
      format.pdf do
        
        pdf = ProfitabilityreportPdf.new(session[:s_user_id], view_context, params[:farm_id], params[:year],
        params[:start_date], params[:stop_date], params[:report_version])
        send_data pdf.render, filename: "profitability_report",
                                type: "application/pdf",
                                disposition: "inline"
        
      end
    end
    
    
  end
  
end
