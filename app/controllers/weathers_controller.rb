class WeathersController < ApplicationController
  # GET /weathers
  # GET /weathers.xml
  
     def index_view
       Party.create_weather
      end

      def index_data

        get_current_user
        @party = Party.select('partyweatherpostalcode').where('system_user_id' => @current_user.id)
        @party.each do |p|
          @weatherpostalcode = p.partyweatherpostalcode
        end
        
        if !@party.nil? and !@weatherpostalcode.nil?
          @weathers = Weather.find_by_sql("Select *  
          from weathers 
          where weathers.postalcode = '#{@weatherpostalcode}' ")  
        end
        
        
       

      end

      def index_dbaction
    		#called for all db actions
 

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
 

    				@tid = @id
    			when "updated"
 

    				@tid = @id
    		end 
    	end
    	
  def index
    @weathers = Weather.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weathers }
    end
  end

  # GET /weathers/1
  # GET /weathers/1.xml
  def show
    @weather = Weather.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weather }
    end
  end

  # GET /weathers/new
  # GET /weathers/new.xml
  def new
    @weather = Weather.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weather }
    end
  end

  # GET /weathers/1/edit
  def edit
    @weather = Weather.find(params[:id])
  end

  # POST /weathers
  # POST /weathers.xml
  def create
    @weather = Weather.new(params[:weather])

    respond_to do |format|
      if @weather.save
        format.html { redirect_to(@weather, :notice => 'Weather was successfully created.') }
        format.xml  { render :xml => @weather, :status => :created, :location => @weather }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weather.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weathers/1
  # PUT /weathers/1.xml
  def update
    @weather = Weather.find(params[:id])

    respond_to do |format|
      if @weather.update_attributes(params[:weather])
        format.html { redirect_to(@weather, :notice => 'Weather was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weather.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weathers/1
  # DELETE /weathers/1.xml
  def destroy
    @weather = Weather.find(params[:id])
    @weather.destroy

    respond_to do |format|
      format.html { redirect_to(weathers_url) }
      format.xml  { head :ok }
    end
  end
end
