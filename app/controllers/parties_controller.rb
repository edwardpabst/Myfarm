class PartiesController < ApplicationController
  # GET /parties
  # GET /parties.xml
  
 
    before_filter :authenticate
  
 
 
  #-------supplies index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
        @parties = Party.where('user_id' => @current_user.id).all

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		partyname = params["c0"]
    		partyjobtitle	 = params["c1"]
    		partycity	= params["c2"]
    		partystate = params["c3"]
    		partyphone = params["c4"]
    		partyemail = params["c5"]
    		rate_hour = params["c6"]
    	

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@party = Party.find(@id)
    				@party.destroy

    				@tid = @id
    			when "updated"
    				@party = Party.find(@id)
    				@party.partyname = partyname
    				@party.partyjobtitle = partyjobtitle
    				@party.partycity = partycity
    				@party.partystate = partystate
    				@party.partyphone = partyphone
    				@party.partyemail = partyemail
    				@party.rate_hour = rate_hour
    		
    	


    				if @party.save

    				else
      				flash[:error] = @party.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
    	
#-------standard ROR scaffold----------------------------------------------------------------------------

  def index
    get_current_user
    @parties = Party.where('user_id' => @current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parties }
    end
  end

  # GET /parties/1
  # GET /parties/1.xml
  def show
    @party = Party.find(params[:id])
 
    getroles(@party.id)
    
    get_user_postal_code() 
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @party }
    end
  end

  # GET /parties/new
  # GET /parties/new.xml
  def new
    @party = Party.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = Party.find(params[:id])
    getroles(params[:id])
    if @party.partyname.blank?
      @party.partyname = @party.partyfirstname + " " +@party.partylastname
    end
  end

  # POST /parties
  # POST /parties.xml
  def create
    @party = Party.new(params[:party])
    if @party.partyname.blank?
      @party.partyname = @party.partyfirstname + " " +@party.partylastname
    end
    if @party.ship_address1.blank? || @party.ship_address1.nil?
      @party.ship_address1 = @party.partyaddress1
      @party.ship_address2 = @party.partyaddress2
      @party.ship_city = @party.partycity
      @party.ship_state = @party.partystate
      @party.ship_postalcode = @party.partypostalcode
      @party.ship_phone = @party.partyphone
    end
       
        @party.user_id = session[:s_user_id]
  	    session[:s_user_email] = nil
  	    
  	    if session[:s_is_new_user] == true
  	      @party.system_user_id = session[:s_user_id]
  	    else
  	      @party.system_user_id = 0
  	    end

    respond_to do |format|
      if @party.save
        if session[:s_is_new_user] == true
          updateuser(@party.id)
          session[:s_is_new_user] = false          
        end
 
        format.html { redirect_to("/partyview",  :notice => 'Party was successfully created.') }
        format.xml  { render :xml => @party, :status => :created, :location => @party }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.xml
  def update
    @party = Party.find(params[:id])

    if @party.partyweatherpostalcode != params{:partyweatherpostalcode}
     if !params{:partyweatherpostalcode}.nil?
       Party.get_weather(session[:s_user_id])
     end
    end

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to("/partyview" , :notice => 'Party was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.xml
  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to(parties_url) }
      format.xml  { head :ok }
    end
  end
  
  def getroles(id)
   
  @partytypes = Party.select("typedescription").joins(:partytypes).where('parties.id' => id).all
   
  end
  
  def updateuser(id)
    @user = User.find(session[:s_user_id].to_i)
    @user.party_id = id
    @user.save
     
  end
  


end
