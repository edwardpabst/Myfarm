class TypesController < ApplicationController
  # GET /types
  # GET /types.xml
  
  before_filter :authenticate
      def index_view


      end

      def index_data

        get_current_user
        @types = Type.find_by_sql("Select types.id, typename, type_value_string, type_value_integer, type_boolean, type_isprotected
        from types
        where user_id = #{@current_user.id}
        order by typename ")
        
       # logger.debug "**** TYPES FILE ****** #{@types.size}" 
      end

      def index_dbaction
    		#called for all db actions
    		typename = params["c0"]
    		type_value_string	 = params["c1"]
    		type_value_integer	= params["c2"]
    		type_boolean = params["c3"]
    		type_isprotected = params["c4"]

    		

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@type = Type.find(@id)
    				@type.destroy

    				@tid = @id
    			when "updated"
    				@type = Type.find(@id)


    				if @type.save

    				else
      				flash[:error] = @type.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ---------------------------------------------------------------- 
  
  def index
  
    get_current_user
    @types = Type.where('user_id' => @current_user.id).all.paginate(:page => params[:page], :per_page => 20)
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @types }
    end
  end

  # GET /types/1
  # GET /types/1.xml
  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @type }
    end
  end

  # GET /types/new
  # GET /types/new.xml
  def new
    @type = Type.new
 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @type }
    end
  end

  # GET /types/1/edit
  def edit
    @type = Type.find(params[:id])
     @onload = 'checkisprotected()'
  end

  # POST /types
  # POST /types.xml
  def create
    @type = Type.new(params[:type])
    @type.user_id = session[:s_user_id]

    respond_to do |format|
      if @type.save
        format.html { redirect_to("/typeview", :notice => 'Type was successfully created.') }
        format.xml  { render :xml => @type, :status => :created, :location => @type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # PUT /types/1.xml
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to("/typeview", :notice => 'Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # DELETE /types/1.xml
  def destroy
    @type = Type.find(params[:id])
    if @type.type_isprotected?
      flash[:error] = "you can not remove a protected type. "
    else
      @type.destroy
    end

    respond_to do |format|
      format.html { redirect_to("/typeview") }
      format.xml  { head :ok }
    end
  end
end
