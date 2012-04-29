class FarmexpensesController < ApplicationController
  # GET /farmexpenses
  # GET /farmexpenses.xml
  before_filter :authenticate
      def index_view


      end
      
      def index_initialize
        set_new_farm_expenses(params[:farmexpense][:plan_year])
        redirect_to(:controller => "farms",  :action => "edit", :id => session[:s_farm_id], :notice => 'farm expense was successfully updated.')
      end

      def index_data

        get_current_user
        @farmexpenses = Farmexpense.find_by_sql("Select farmexpenses.id, expense_year, expense_type, expense_name, expense_amount
        from farmexpenses
        where farm_id = #{session[:s_farm_id]}
        order by expense_year, expense_type, expense_name ")
        
       # logger.debug "**** farmexpenseS FILE ****** #{@farmexpenses.size}" 
      end

      def index_dbaction
    		#called for all db actions
    		expense_year = params["c0"]
    		expense_type	 = params["c1"]
    		expense_name	= params["c2"]
    		expense_amount = params["c3"]
    	 

    		

    		@mode = params["!nativeeditor_status"]

    		@id = params["gr_id"]
    		case @mode

    			when "deleted"
    				@farmexpense = Farmexpense.find(@id)
    				@farmexpense.destroy

    				@tid = @id
    			when "updated"
    				@farmexpense = Farmexpense.find(@id)
    				@farmexpense.expense_amount = expense_amount


    				if @farmexpense.save

    				else
      				flash[:error] = @farmexpense.errors 
              render 'index_view' 				  
    				end

    				@tid = @id
    		end 
    	end 
  
  #---------standard ROR scaffold ---------------------------------------------------------------- 
  
  def index
    @farmexpenses = Farmexpense.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @farmexpenses }
    end
  end

  # GET /farmexpenses/1
  # GET /farmexpenses/1.xml
  def show
    @farmexpense = Farmexpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @farmexpense }
    end
  end

  # GET /farmexpenses/new
  # GET /farmexpenses/new.xml
  def new
    @farmexpense = Farmexpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @farmexpense }
    end
  end

  # GET /farmexpenses/1/edit
  def edit
    @farmexpense = Farmexpense.find(params[:id])
 
  end

  # POST /farmexpenses
  # POST /farmexpenses.xml
  def create
    @farmexpense = Farmexpense.new(params[:farmexpense])
    @farmexpense.user_id = session[:s_user_id]
    @farmexpense.farm_id = session[:s_farm_id]
    respond_to do |format|
      if @farmexpense.save
       format.html { redirect_to(:controller => "farms",  :action => "edit", :id => session[:s_farm_id], :notice => 'farm expense was successfully updated.') }
       format.xml  { render :xml => @farmexpense, :status => :created, :location => @farmexpense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @farmexpense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /farmexpenses/1
  # PUT /farmexpenses/1.xml
  def update
    @farmexpense = Farmexpense.find(params[:id])

    respond_to do |format|
      if @farmexpense.update_attributes(params[:farmexpense])
        format.html { redirect_to(:controller => "farms",  :action => "edit", :id => session[:s_farm_id], :notice => 'farm expense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @farmexpense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /farmexpenses/1
  # DELETE /farmexpenses/1.xml
  def destroy
    @farmexpense = Farmexpense.find(params[:id])
    @farmexpense.destroy

    respond_to do |format|
      format.html { redirect_to(farmexpenses_url) }
      format.xml  { head :ok }
    end
  end
end
