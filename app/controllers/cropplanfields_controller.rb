class CropplanfieldsController < ApplicationController
  # GET /cropplanfields
  # GET /cropplanfields.xml
  
      def index_view


      end

      def index_data

        get_current_user
         @cropplanfields = Cropplanfield.find_by_sql("Select farmname, fieldname, fields.number_acres,
                               cpf.plan_acres, cpf.avg_yield, cpf.yield_uom 
        from cropplanfields cpf
        join cropplans cp on cpf.cropplan_id = cp.id
        join crops on cp.crop_id = crops.id
        join fields on cpf.field_id = fields.id

        where cpf.user_id = #{@current_user.id } 
        and cpf.cropplan_id = #{session[:s_cropplan_id]}")

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

  # GET /cropplanfields/1/edit
  def edit
    @cropplanfield = Cropplanfield.find(params[:id])
    @cropplan = Cropplan.find(session[:s_cropplan_id])
  end

  # POST /cropplanfields
  # POST /cropplanfields.xml
  def create
    @cropplanfield = Cropplanfield.new(params[:cropplanfield])
    @cropplanfield.user_id = session[:s_user_id]
    @cropplanfield.cropplan_id = session[:s_cropplan_id]
    @cropplan = Cropplan.find(session[:s_cropplan_id])
    @crop = Crop.find(@cropplan.crop_id)
    @cropplanfield.yield_uom = @crop.crop_inventory_uom
    respond_to do |format|
      if @cropplanfield.save
        format.html { redirect_to(:controller => "cropplans",  :action => "edit", :id => session[:s_cropplan_id], :notice => 'Cropplan Field was successfully created.') }
        
        format.xml  { render :xml => @cropplanfield, :status => :created, :location => @cropplanfield }
      else
        format.html { render :action => "new" }
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
        format.html { redirect_to(:controller => "cropplans",  :action => "edit", :id => session[:s_cropplan_id], :notice => 'Cropplan Field was successfully created.') }
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
