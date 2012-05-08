class RetailcropsController < ApplicationController
  # GET /retailcrops
  # GET /retailcrops.xml
  
    before_filter :authenticate

      def index_view


      end

      def index_data
        get_current_user
       
         @retailcrops = Retailcrop.find_by_sql("Select rc.*, farmname, partycity as farm_city, partystate as farm_state,
                    cropplanfull
        from retailcrops rc
        join farms on rc.farm_id = farms.id
        join parties p1 on farms.party_id = p1.id 
        left join cropplans cp on rc.cropplan_id = cp.id
        where rc.user_id = #{@current_user.id } 
        order by cropplanfull")

      end
      
          def index_dbaction
        		#called for all db actions
        		sales_price = params["c6"]
        		ship_charge	 = params["c8"]
        		sales_notes	= params["c9"]


        		@mode = params["!nativeeditor_status"]

        		@id = params["gr_id"]
        		case @mode
        			when "inserted"
        				@crop = Crop.new

        				if @crop.save

        				else
                  flash[:error] = @crop.errors 
                  render 'index_view'				  
        				end

        				@tid = @crop.id
        			when "deleted"
        				@crop=Retailcrop.find(@id)
        				@crop.destroy

        				@tid = @id
        			when "updated"
        				@crop = Retailcrop.find(@id)
        				@crop.sales_price = sales_price
        				@crop.ship_charge = ship_charge
        				@crop.sales_notes = sales_notes

        				if @crop.save

        				else
          				flash[:error] = @crop.errors 
                  render 'index_view' 				  
        				end

        				@tid = @id
        		end 
        	end

      #-------- Standard ROR scaffold --------------------------------------------
      def indexall_view


      end

      def indexall_data
        get_current_user
       
         @retailcrops = Retailcrop.find_by_sql("Select rc.*, farmname, partycity as farm_city, partystate as farm_state,
                    cropplanfull
        from retailcrops rc
        join farms on rc.farm_id = farms.id
        join parties p1 on farms.party_id = p1.id 
        left join cropplans cp on rc.cropplan_id = cp.id
        where rc.status = 'active'
        order by farmname, cropplanfull ")

      end
      
          def indexall_dbaction
        		#called for all db actions
 


        		@mode = params["!nativeeditor_status"]

        		@id = params["gr_id"]
        		case @mode
        			when "inserted"
        				@crop = Crop.new

        				if @crop.save

        				else
                  flash[:error] = @crop.errors 
                  render 'index_view'				  
        				end

        				@tid = @crop.id
        			when "deleted"
        				@crop=Retailcrop.find(@id)
        				@crop.destroy

        				@tid = @id
        			when "updated"
        				@crop = Retailcrop.find(@id)


        				if @crop.save

        				else
          				flash[:error] = @crop.errors 
                  render 'index_view' 				  
        				end

        				@tid = @id
        		end 
        	end

      #-------- Standard ROR scaffold --------------------------------------------
      def index
        get_current_user
        @retailcrops = Retailcrop.where('user_id' => @current_user.id).all


        respond_to do |format|                                                     
        format.html  
        format.xml { render :xml => @crop  }

        end
      end



  # GET /retailcrops/1
  # GET /retailcrops/1.xml
  def show
    @retailcrop = Retailcrop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @retailcrop }
    end
  end

  # GET /retailcrops/new
  # GET /retailcrops/new.xml
  def new
    @retailcrop = Retailcrop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @retailcrop }
    end
  end

  # GET /retailcrops/1/edit
  def edit
    @retailcrop = Retailcrop.find(params[:id])
  end
  
  def view
    @retailcrop = Retailcrop.find(params[:id])
    @cropplan = Cropplan.find(@retailcrop.cropplan_id)
    @farm = Farm.find(@retailcrop.farm_id)
  end

  # POST /retailcrops
  # POST /retailcrops.xml
  def create
    @retailcrop = Retailcrop.new(params[:retailcrop])
    @retailcrop.user_id = session[:s_user_id]
    respond_to do |format|
      if @retailcrop.save
        format.html { redirect_to('/retailcropview', :notice => 'Retailcrop was successfully created.') }
        format.xml  { render :xml => @retailcrop, :status => :created, :location => @retailcrop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @retailcrop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retailcrops/1
  # PUT /retailcrops/1.xml
  def update
    @retailcrop = Retailcrop.find(params[:id])

    respond_to do |format|
      if @retailcrop.update_attributes(params[:retailcrop])
        format.html { redirect_to('/retailcropview', :notice => 'Retailcrop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @retailcrop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retailcrops/1
  # DELETE /retailcrops/1.xml
  def destroy
    @retailcrop = Retailcrop.find(params[:id])
    @retailcrop.destroy

    respond_to do |format|
      format.html { redirect_to(retailcrops_url) }
      format.xml  { head :ok }
    end
  end
end
