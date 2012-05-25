class ContractsController < ApplicationController
  # GET /contracts
  # GET /contracts.xml
  
  before_filter :authenticate


  #-------scaleticket index----------------------------------------------------------------------------
      def index_view


      end

      def index_data

        get_current_user
         @contracts = Contract.find_by_sql("Select contracts.id, partyname as customername, contract_date, cropplanfull, contract_uom, 
         contract_price, min_qty, max_qty, contract_number , payment_terms
        from contracts 
        join parties on contracts.party_id = parties.id
        join cropplans on contracts.cropplan_id = cropplans.id
        where contracts.user_id = #{@current_user.id } ")

        #logger.debug "FARMJOBLABOR #{@farmjoblabors.size}" 
        #logger.debug "SESSION_JOBS_ID #{session[:s_farmjob_id]}"

      end

      def index_dbaction
    		#called for all db actions
    		customername = params["c0"]
    		contract_date	 = params["c1"]
    		cropplanfull  = params["c2"]   
    		contract_uom	= params["c3"]
    		contract_price = params["c4"]
    		min_qty = params["c5"]
    		max_qty = params["c6"]
    		contract_number = params["c7"]
    		payment_terms = params["c8"]

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
   
      				@contract = Contract.find(@id)
      				@contract.destroy
      			 
            
      				@tid = @id
  
    			when "updated"
    				@contract = Contract.find(@id)
    				@contract.contract_price = contract_price 
    				@contract.min_qty = min_qty
    				@contract.max_qty = max_qty
    				@contract.contract_number = contract_number
    			 
    				if @contract.save

    				else
      				flash[:error] = @contract.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ----------------------------------------------------------------
  
  def index
    @contracts = Contract.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contracts }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.xml
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.xml
  def new
    @contract = Contract.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
  end

  # POST /contracts
  # POST /contracts.xml
  def create
    @contract = Contract.new(params[:contract])
    @contract.user_id = session[:s_user_id]
    respond_to do |format|
      if @contract.save
        format.html { redirect_to("/contractview", :notice => 'Contract was successfully created.') }
        format.xml  { render :xml => @contract, :status => :created, :location => @contract }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.xml
  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to("/contractview", :notice => 'Contract was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.xml
  def destroy
    @contract = Contract.find(params[:id])
    begin
      @contract.destroy 
      rescue ActiveRecord::DeleteRestrictionError => e
      @contract.errors.add(:base, e)
    end 
    respond_to do |format|

        if e.nil?
    
          format.html { redirect_to("/contractview", :notice => 'Contract was successfully deleted.') }
          format.xml  { head :ok }
        else          
          format.html { render :action => "edit" }
        end
   
    
    end
  end
end
