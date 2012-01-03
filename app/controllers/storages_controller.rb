class StoragesController < ApplicationController
  # GET /storages
  # GET /storages.xml
  
  before_filter :authenticate

  #-------storage index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
        @storages = Storage.where('user_id' => @current_user.id).all

    

      end

      def index_dbaction
    		#called for all db actions
    		name = params["c0"]
    		storage_type	 = params["c1"]
    		size	= params["c2"]
    		size_uom = params["c3"]
    		location = params["c4"]
    		capacity = params["c5"]
    		capacity_uom = params["c6"]
    		yearly_cost = params["c7"]
    		

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@storage = Storage.find(@id)
    				@storage.destroy

    				@tid = @id
    			when "updated"
    				@storage = Storage.find(@id)
    				@storage.name = name 
    				@storage.size = size
    				@storage.location = location
    				@storage.capacity = capacity
    				@storage.yearly_cost = yearly_cost

    	


    				if @storage.save

    				else
      				flash[:error] = @storage.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ---------------------------------------------------------------- 
  
  def index
    get_current_user
    @storages = Storage.where('user_id' => @current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @storages }
    end
  end

  # GET /storages/1
  # GET /storages/1.xml
  def show
    @storage = Storage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @storage }
    end
  end

  # GET /storages/new
  # GET /storages/new.xml
  def new
    @storage = Storage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @storage }
    end
  end

  # GET /storages/1/edit
  def edit
    @storage = Storage.find(params[:id])
  end

  # POST /storages
  # POST /storages.xml
  def create
    @storage = Storage.new(params[:storage])
    @storage.user_id = session[:s_user_id]
    respond_to do |format|
      if @storage.save
        format.html { redirect_to("/storageview", :notice => 'Storage was successfully created.') }
        format.xml  { render :xml => @storage, :status => :created, :location => @storage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @storage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /storages/1
  # PUT /storages/1.xml
  def update
    @storage = Storage.find(params[:id])

    respond_to do |format|
     # logger.debug "EVENTNAME PARAMS STORAGE#{params[:storage]}"
      if @storage.update_attributes(params[:storage])
        format.html { redirect_to("/storageview", :notice => 'Storage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @storage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /storages/1
  # DELETE /storages/1.xml
  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy

    respond_to do |format|
      format.html { redirect_to(storages_url) }
      format.xml  { head :ok }
    end
  end
end
