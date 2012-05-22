class CropplanfieldsController < ApplicationController
  # GET /cropplanfields
  # GET /cropplanfields.xml
  
      def index_view


      end

      def index_data

        get_current_user
         @cropplanfields = Cropplanfield.find_by_sql("Select cpf.id, farmname, fieldname, fields.number_acres,
                               cpf.plan_acres, cpf.avg_yield, cpf.yield_uom 
        from cropplanfields cpf
        join cropplans cp on cpf.cropplan_id = cp.id
        join crops on cp.crop_id = crops.id
        join fields on cpf.field_id = fields.id

        where cpf.user_id = #{@current_user.id } 
        and cpf.cropplan_id = #{session[:s_cropplan_id]}
        and cp.plan_status <> 'complete'")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions



    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"

      				@cropplanfield = Cropplanfield.find(@id)
      				#adjust (replace) inventory
      				@cropplanfield.destroy


      				@tid = @id

    			when "updated"
    				@cropplanfield = Cropplanfield.find(@id)
    				@cropplanfield.detail_status = detail_status

        				if @cropplanfield.save

                else
          				flash[:error] = @cropplanfield.errors 

        				end

			   


						@tid = @id
    		end 
    	end 

  #---------standard ROR scaffold ----------------------------------------------------------------
      def crop_index_view


      end

      def crop_index_data

        get_current_user
         @cropplanfields = Cropplanfield.find_by_sql("Select cpf.id, cropplanfull, plan_status, fields.number_acres,
                               cpf.plan_acres, cpf.avg_yield, cpf.yield_uom 
        from cropplanfields cpf
        join cropplans cp on cpf.cropplan_id = cp.id
        join crops on cp.crop_id = crops.id
        join fields on cpf.field_id = fields.id

        where cpf.user_id = #{@current_user.id } 
        and cpf.field_id = #{session[:s_field_id]}
        and cp.plan_status <> 'complete'")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def crop_index_dbaction
    		#called for all db actions



    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"

      				@cropplanfield = Cropplanfield.find(@id)
      				#adjust (replace) inventory
      				@cropplanfield.destroy


      				@tid = @id

    			when "updated"
    				@cropplanfield = Cropplanfield.find(@id)
    				@cropplanfield.detail_status = detail_status

        				if @cropplanfield.save

                else
          				flash[:error] = @cropplanfield.errors 

        				end

			   


						@tid = @id
    		end 
    	end 

  #---------standard ROR scaffold ----------------------------------------------------------------  
  def index
    @cropplanfields = Cropplanfield.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cropplanfields }
    end
  end

  # GET /cropplanfields/1
  # GET /cropplanfields/1.xml
  def show
    @cropplanfield = Cropplanfield.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cropplanfield }
    end
  end

  # GET /cropplanfields/new
  # GET /cropplanfields/new.xml
  def new
    @cropplanfield = Cropplanfield.new
    @cropplan = Cropplan.find(session[:s_cropplan_id])
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cropplanfield }
    end
  end
  
  def new_crop
    @cropplanfield = Cropplanfield.new
    @cptransaction = 'new'
   
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cropplanfield }
    end
  end

  # GET /cropplanfields/1/edit
  def edit
    @cropplanfield = Cropplanfield.find(params[:id])
    @cropplan = Cropplan.find(session[:s_cropplan_id])
  end
  
  def edit_crop
    @cropplanfield = Cropplanfield.find(params[:id])
    @cropplan = Cropplan.find(session[:s_cropplan_id])
    @cptransaction = 'edit'
    
  
  end

  # POST /cropplanfields
  # POST /cropplanfields.xml
  def create
      
    @cropplanfield = Cropplanfield.new(params[:cropplanfield])
    if session[:s_cropplan_transaction] == 'field'
        session[:s_cropplan_id] = @cropplanfield.cropplan_id
        @cropplanfield.field_id = session[:s_field_id]
    end
    if @cptransaction == 'new'      
      @cptransaction = 'edit'
    end
    @cropplanfield.user_id = session[:s_user_id]
    if session[:s_cropplan_transaction] == 'cropplan'
      @cropplanfield.cropplan_id = session[:s_cropplan_id] 
    end
     
    @cropplan = Cropplan.find(session[:s_cropplan_id])
    @crop = Crop.find(@cropplan.crop_id)
    @cropplanfield.yield_uom = @crop.crop_inventory_uom
    respond_to do |format|
      if @cropplanfield.save
        if session[:s_cropplan_transaction] == 'cropplan'
          format.html { redirect_to(:controller => "cropplans",  :action => "edit", :id => session[:s_cropplan_id], :notice => 'Cropplan Field was successfully created.') }
        else
          format.html { redirect_to(:controller => "fields",  :action => "edit", :id => session[:s_field_id], :notice => 'Cropplan field was successfully created.') }         
        end
        format.xml  { render :xml => @cropplanfield, :status => :created, :location => @cropplanfield }
      else
        if session[:s_cropplan_transaction] == 'cropplan'
          format.html { render :action => "new" }
        else
          format.html { render :action => "new_crop" }
        end
        format.xml  { render :xml => @cropplanfield.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cropplanfields/1
  # PUT /cropplanfields/1.xml
  def update
    @cropplanfield = Cropplanfield.find(params[:id])

    respond_to do |format|
      if @cropplanfield.update_attributes(params[:cropplanfield])
        if session[:s_cropplan_transaction] == 'cropplan'
          format.html { redirect_to(:controller => "cropplans",  :action => "edit", :id => session[:s_cropplan_id], :notice => 'Cropplan Field was successfully created.') }
        else
           
          format.html { redirect_to(:controller => "fields",  :action => "edit", :id => session[:s_field_id], :notice => 'Cropplan field was successfully created.') }         
        end
       format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cropplanfield.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cropplanfields/1
  # DELETE /cropplanfields/1.xml
  def destroy
    @cropplanfield = Cropplanfield.find(params[:id])
    @cropplanfield.destroy

    respond_to do |format|
      format.html { redirect_to(cropplanfields_url) }
      format.xml  { head :ok }
    end
  end
end
