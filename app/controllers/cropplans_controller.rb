class CropplansController < ApplicationController
  # GET /cropplans
  # GET /cropplans.xml
  

    before_filter :authenticate

      def index_view


      end

      def index_data
        get_current_user
        @cropplans = Cropplan.where('user_id' => @current_user.id).all

      end

      def dbaction
    		#called for all db actions
    		cropplanfull = params["c0"]
    		plan_status	 = params["c1"]
 


    				@tid = @id
     
    	end

  #-------- Standard ROR scaffold --------------------------------------------

  def index
    get_current_user
    @cropplans = Cropplan.find_by_sql("Select cropplans.id, cropplanfull, crop_id, plan_year, plan_status
    from cropplans
    where cropplans.user_id = #{@current_user.id } ")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cropplans }
    end
  end

  # GET /cropplans/1
  # GET /cropplans/1.xml
  def show
    @cropplan = Cropplan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cropplan }
    end
  end

  # GET /cropplans/new
  # GET /cropplans/new.xml
  def new
    @cropplan = Cropplan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cropplan }
    end
  end

  # GET /cropplans/1/edit
  def edit
    @cropplan = Cropplan.find(params[:id])
  end

  # POST /cropplans
  # POST /cropplans.xml
  def create
    @cropplan = Cropplan.new(params[:cropplan])
    @cropplan.user_id = session[:s_user_id]
    crop = Crop.find_by_id(@cropplan.crop_id)
    if !crop.nil?
      @cropplan.cropplanfull = "#{crop.cropfull}: #{@cropplan.plan_year}"
    end
    respond_to do |format|
      if @cropplan.save
        format.html { redirect_to("/cropplanview", :notice => 'Cropplan was successfully created.') }
        format.xml  { render :xml => @cropplan, :status => :created, :location => @cropplan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cropplan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cropplans/1
  # PUT /cropplans/1.xml
  def update
    @cropplan = Cropplan.find(params[:id])
    crop = Crop.find_by_id(@cropplan.crop_id)
    @cropplan.cropplanfull = "#{crop.cropfull}: #{@cropplan.plan_year}"
    
    respond_to do |format|
      if @cropplan.update_attributes(params[:cropplan])
        format.html { redirect_to("/cropplanview", :notice => 'Cropplan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cropplan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cropplans/1
  # DELETE /cropplans/1.xml
  def destroy
    @cropplan = Cropplan.find(params[:id])
    @cropplan.destroy

    respond_to do |format|
      format.html { redirect_to(cropplans_url) }
      format.xml  { head :ok }
    end
  end
end
