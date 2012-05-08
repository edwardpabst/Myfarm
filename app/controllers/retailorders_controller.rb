class RetailordersController < ApplicationController
  # GET /retailorders
  # GET /retailorders.xml
  
    before_filter :authenticate

          def ordersfromme_view


          end

          def ordersfromme_data
            get_current_user

             @retailorders = Retailorder.find_by_sql("Select ro.*, farmname, p1.partyphone as farm_phone, 
                        p2.partyname as customername, p2.partycity as customercity, p2.partystate as customerstate,
                        p2.partyphone as bill_phone
            from retailorders ro
            join farms on ro.farm_id = farms.id
            join parties p1 on farms.party_id = p1.id 
            join parties p2 on ro.order_user_id = p2.system_user_id 
            where ro.order_user_id = #{@current_user.id } ")

          end


          def ordersfromme_dbaction
        		#called for all db actions



        		@mode = params["!nativeeditor_status"]

        		@id = params["gr_id"]
        		case @mode
        			when "inserted"
        				@retailorder = Retailorder.new

        				if @retailorder.save

        				else
                  flash[:error] = @retailorder.errors 
                  render 'index_view'				  
        				end

        				@tid = @retailorder.id
        			when "deleted"
        				@retailorder=Retailorder.find(@id)
        				@retailorder.destroy

        				@tid = @id
        			when "updated"
        				@retailorder = Retailorder.find(@id)


        				if @retailorder.save

        				else
          				flash[:error] = @retailorder.errors 
                  render 'index_view' 				  
        				end

        				@tid = @id
        		end 
        	end

    #-------------------------------------------------------------------------------------------------------   	

      def orderstome_view


      end

      def orderstome_data
        get_current_user
       
         @retailorders = Retailorder.find_by_sql("Select ro.*, farmname, p1.partyphone as farm_phone, 
                    p2.partyname as customername, p2.partycity as customercity, p2.partystate as customerstate,
                    p2.partyphone as bill_phone
        from retailorders ro
        join farms on ro.farm_id = farms.id
        join parties p1 on farms.party_id = p1.id 
        join parties p2 on ro.order_user_id = p2.system_user_id 
        where ro.source_user_id = #{@current_user.id } ")

      end
      

      def orderstome_dbaction
    		#called for all db actions
 
 

    		@mode = params["!nativeeditor_status"]
    		
    		@id = params["gr_id"]
    		case @mode
    			when "inserted"
    				@retailorder = Retailorder.new

    				if @retailorder.save

    				else
              flash[:error] = @retailorder.errors 
              render 'index_view'				  
    				end

    				@tid = @retailorder.id
    			when "deleted"
    				@retailorder=Retailorder.find(@id)
    				@retailorder.destroy

    				@tid = @id
    			when "updated"
    				@retailorder = Retailorder.find(@id)


    				if @retailorder.save

    				else
      				flash[:error] = @retailorder.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end
    	
#-------------------------------------------------------------------------------------------------------   	
    	def retailcropadd_view


      end

      def retailcropadd_data
        get_current_user
        @retailorder = Retailorder.find(session[:s_retailorder_id])
       
         @retailcrops = Retailcrop.find_by_sql("Select rc.*, farmname, partycity as farm_city, partystate as farm_state,
                    cropplanfull
        from retailcrops rc
        join farms on rc.farm_id = farms.id
        join parties p1 on farms.party_id = p1.id 
        left join cropplans cp on rc.cropplan_id = cp.id
        where rc.user_id = #{@retailorder.source_user_id } 
        and rc.farm_id = #{session[:s_farm_id]}
        and rc.status = 'active' ")

      end
      

      def retailcropadd_dbaction
    		#called for all db actions
 
 

    		@mode = params["!nativeeditor_status"]
    		
    		@id = params["gr_id"]
    		case @mode
    			when "inserted"
    				@retailorder = Retailorder.new

    				if @retailorder.save

    				else
              flash[:error] = @retailorder.errors 
              render 'index_view'				  
    				end

    				@tid = @retailorder.id
    			when "deleted"
    				@retailorder=Retailorder.find(@id)
    				@retailorder.destroy

    				@tid = @id
    			when "updated"
    				@retailorder = Retailorder.find(@id)


    				if @retailorder.save

    				else
      				flash[:error] = @retailorder.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end

  #-------- Standard ROR scaffold --------------------------------------------
  def index
    @retailorders = Retailorder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @retailorders }
    end
  end

  # GET /retailorders/1
  # GET /retailorders/1.xml
  def show
    @retailorder = Retailorder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retailorder }
    end
  end

  # GET /retailorders/new
  # GET /retailorders/new.xml
  def new
    @retailorder = Retailorder.new
     
     @orderinfo = Party.find_by_sql("Select * from parties 
     where parties.system_user_id = #{session[:s_user_id]} ")
     
     @orderinfo.each  do |orderinfo|
       @retailorder.customername = orderinfo.partyname
       @retailorder.bill_address1 = orderinfo.partyaddress1
       @retailorder.bill_address2 = orderinfo.partyaddress2
       @retailorder.bill_city = orderinfo.partycity
       @retailorder.bill_state = orderinfo.partystate
       @retailorder.bill_postalcode = orderinfo.partypostalcode
       @retailorder.bill_phone = orderinfo.partyphone
       @retailorder.bill_email = orderinfo.partyemail
     
       @retailorder.ship_address1 = orderinfo.ship_address1
       @retailorder.ship_address2 = orderinfo.ship_address2
       @retailorder.ship_city = orderinfo.ship_city
       @retailorder.ship_state = orderinfo.ship_state
       @retailorder.ship_postalcode = orderinfo.ship_postalcode

    end
 
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retailorder }
    end
  end

  # GET /retailorders/1/edit
  def edit
    session[:s_retailorder_id] = params[:id]
    @retailorder = update_order_amount(params[:id])
    session[:s_farm_id] = @retailorder.farm_id
    if session[:s_user_type] == 'crop customer' 
      @onload = 'checkOrder()'
    end 
  end

  # POST /retailorders
  # POST /retailorders.xml
  def create
    @retailorder = Retailorder.new(params[:retailorder])
    @retailorder.order_user_id = session[:s_user_id] 
    @farm = Farm.find(params[:retailorder][:farm_id])
    if !@farm.nil?
      @retailorder.source_user_id = @farm.user_id
    end
    respond_to do |format|
      if @retailorder.save
        format.html { redirect_to(:controller => :retailorders, :action => :edit, :id => @retailorder.id, 	:notice => 'Order was successfully created. You can now add line items.') }
        
        format.xml  { render :xml => @retailorder, :status => :created, :location => @retailorder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retailorder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retailorders/1
  # PUT /retailorders/1.xml
  def update
    @retailorder = Retailorder.find(params[:id])

    respond_to do |format|
      if @retailorder.update_attributes(params[:retailorder])
        format.html { redirect_to(:controller => :retailorders, :action => :edit, :id => @retailorder.id, 	:notice => 'Order was successfully update') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retailorder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retailorders/1
  # DELETE /retailorders/1.xml
  def destroy
    @retailorder = Retailorder.find(params[:id])
    @retailorder.destroy

    respond_to do |format|
      format.html { redirect_to(retailorders_url) }
      format.xml  { head :ok }
    end
  end
  
  def update_order_amount(id)
    @retailorder = Retailorder.find(id)
    @retailorder_amount = Retailorderdetail.find_all_by_retailorder_id(id) 
  
    if !@retailorder_amount.nil? and !@retailorder_amount.empty?
      amount = 0
      @retailorder_amount.each do |sa|

        amount += (sa.detail_qty * (sa.detail_price+ sa.detail_shipcharge)) 
      end
      @retailorder.order_total = amount
    else
      @retailorder.order_total = 0     
    end
     @retailorder.save
    return  @retailorder
  end
end
