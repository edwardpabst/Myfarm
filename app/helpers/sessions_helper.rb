module SessionsHelper
  
  

  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    @current_user = user 
    set_current_user_data
    #logger.debug "STEP 1 OF CURRENT USER VERIFY:- #{@current_user.id} - #{@current_user.name} "
    @needs_party = check_user_status   
  end
  
  #def current_user=(user)
    #@current_user ||= user_from_remember_token
  #end
  
  def get_current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    #!current_user = nil
    get_current_user
    !@current_user.nil?
  end
  
  def set_new_user_data
    get_current_user
    set_current_parms
    session[:s_is_new_user] = true
    create_types_data(@current_user.id)
    create_fieldtasks_data(@current_user.id)
  end
  
  def set_new_farm_expenses(year)
    get_current_user
    create_farmexpenses_data(@current_user.id, year)
  end
  
  def set_current_user_data
    get_current_user
    set_current_parms
    session[:s_is_new_user] = false
  end
  
  def create_types_data(user_id)
    #replicate types table with new user id
    @types = Type.find_by_sql("select * from types where user_id = 1")
    @types.each do |t|
      @newtype = Type.new
      @newtype.user_id = user_id 
      @newtype.typename = t.typename
      @newtype.type_value_string = t.type_value_string
      @newtype.type_value_integer = t.type_value_integer
      @newtype.type_boolean = t.type_boolean
      @newtype.type_isprotected = t.type_isprotected
      @newtype.save
    end
  end
  
  def create_fieldtasks_data(user_id)
    #replicate farm expenses
    @fieldtasks = Fieldtask.find_by_sql("select * from fieldtasks where user_id = 1")
    @fieldtasks.each do |t|
      @newfieldtask = Fieldtask.new
      @newfieldtask.user_id = user_id 
      @newfieldtask.task_type = t.task_type
      @newfieldtask.taskdescription = t.taskdescription
      @newfieldtask.task_notes = t.task_notes
      @newfieldtask.task_stage = t.task_stage
      @newfieldtask.task_frequency_days = t.task_frequency_days
      @newfieldtask.task_duration_days = t.task_duration_days
      @newfieldtask.save
    end
    
    
  end
    
  def create_farmexpenses_data(user_id, year)
    #replicate farm expenses

    @farmexpenses = Farmexpense.find_by_sql("select * from farmexpenses where user_id = 1 and expense_year = '2011' ")
    @farmexpenses.each do |t|
    
      @newfarmexpense = Farmexpense.new
      @newfarmexpense.user_id = user_id 
      @newfarmexpense.farm_id = session[:s_farm_id]
      @newfarmexpense.expense_type = t.expense_type
      @newfarmexpense.expense_name = t.expense_name
      @newfarmexpense.expense_amount = 0
      @newfarmexpense.expense_year = year
      @newfarmexpense.save
    end
    
    
  end
  
  def set_current_parms
    session[:s_user_id] = @current_user.id
    session[:s_user_name] = @current_user.name
    session[:s_user_type] = @current_user.user_type
    if session[:s_is_new_user] == true
      session[:s_user_email] = @current_user.email
    else
      session[:s_user_email] = nil
    end
  end

  
  def sign_out
    cookies.delete(:remember_token)
    cookies.delete(:s_is_new_user)
    @current_user = nil
    cookies.delete(:s_user_id)
    cookies.delete(:s_user_name)
    cookies.delete(:s_user_email)
    cookies.delete(:s_is_new_user)
    cookies.delete(:email)
    cookies.delete(:password)
  end
  
  
  def authenticate
     # logger.debug "AUTHENTICATE:- #{@current_user.inspect} -"
      deny_access unless signed_in?
  end
  
  def check_user_status
    @needs_party = false
    if session[:s_is_new_user] != true
      if !user_has_party?
        session[:s_is_new_user] = true
        #flash[:notice] = 'Please supply your party information before we get started.'
        @needs_party = true
      end
    end
    
    return @needs_party
    
  end
  
  def user_has_party?
    get_current_user
    if !@current_user.nil?
        @user_complete = Party.find_by_system_user_id(@current_user.id)
    else
        @user_complete = nil
        if @user_complete.nil?
          return false
        else
          return true
        end
    end
  end
  
  def current_user?(user)
    user == @current_user
  end
  
  def deny_access
    store_location
    flash[:error] = "Please sign in to access this page." 
    redirect_to signin_path, notice => "Please sign in to access this page."  
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to 
  end
  
  def redirect_for_farmjob
    redirect_to(session[:return_to])
    clear_return_to 
  end
  
  def get_user_postal_code()
   
    unless @current_user.nil? 
        @partypostal = Party.find_party_by_user_id(session[:s_user_id]) 
    	   unless @partypostal.empty?  
		         @partypostal.each  do  |f|   
		 		     @postalcode = f.partyweatherpostalcode   
			       end 
			       return @postalcode 
			   else
			      return  "94109"
		     end  
  		       
    else
      return  "94109"
    end      
  end
  
  def get_types_by_name(name)
    get_current_user
   @types = Type.where('typename' => name, 'user_id' => @current_user.id).order('type_value_string').all
  end
  
  def get_customer_order_status
    get_current_user
    @types =  Type.find_by_sql("Select *  
     from types 
     where types.user_id = #{@current_user.id } 
     and types.typename = 'order_status'
     and type_value_string in ('New', 'submitted')")
  end
  
  def get_farmer_order_status
    get_current_user
    @types =  Type.find_by_sql("Select *  
     from types 
     where types.user_id = #{@current_user.id } 
     and types.typename = 'order_status'
     and type_value_string not in ('New', 'submitted')")
  end
  
  def get_invoice_status
    @types =  Type.find_by_sql("Select *  
     from types 
     where types.user_id = #{@current_user.id } 
     and types.typename = 'invoice_status'
     and type_value_string in ('PRINTED', 'RE-PRINTED', 'PAID/CLOSED')")
  end
  
  def get_customer_name(shipment_id)
    @customer =  Shipment.find_by_sql("Select partyname as customername 
                  from shipments sh
                  left join parties p1 on sh.customer_id = p1.id
                  where sh.id = #{shipment_id}")
  end
  
  def get_types_by_name_0(name)
   @types = Type.where('typename' => name, 'user_id' => 1).order('type_value_string').all
  end
  
  def get_supplies_by_type(type)
   if type.nil? || type.blank?
     @supplies = Supply.where('user_id' => @current_user.id).order('supply_type').all
   else
     @supplies = Supply.where('user_id' => @current_user.id, 'supply_type' => type).order('supply_type').all
   end
  end
  
  def get_equipment_by_type()
   @equipments = Equipment.where('user_id' => @current_user.id).order('category').all
  end
  
  def find_parties_by_role(role)
      Party.joins(:partytypes).where('partytypes.typedescription' => role).where('user_id' => @current_user.id).all
  end
  

  
  def get_parties_by_type(type)
      @party_types = Party.select("parties.id, partyname, partyjobtitle").joins(:partytypes).where('partytypes.typedescription' => type , 'parties.user_id' => session[:s_user_id]).all
  end
  
  def get_parties_for_labor 
      #@party_types = Party.select("parties.id, partyname, partyjobtitle").joins(:partytypes).where('partytypes.typedescription' => type , 'parties.user_id' => session[:s_user_id]).all
       @party_types = Party.find_by_sql("Select parties.id, partyname, partyjobtitle   
      from partytypes 
      join partyroles on partytypes.id = partyroles.partytype_id
      join parties on partyroles.party_id = parties.id
      where parties.user_id = #{@current_user.id } 
      and partytypes.typecode in ('EMPL', 'LBRMACH', 'LBRNON', 'CONTRACT')")
  end

  def get_current_shipment()
   @shipment = Shipment.find(session[:s_shipment_id])
  end
  
   def get_crops_by_type()
    @crops = Crop.where('user_id' => @current_user.id).order('croptype').all
   end
   
   def get_farms
    @farms = Farm.where('user_id' => @current_user.id).all
   end
   
   def get_farms_all
    @farms =  Farm.find_by_sql("Select farms.id, (farmname || ' ' || partycity || ' ' || partystate) as farmfull
                           from farms
                           join parties on farms.party_id = parties.id
                           order by farmname")
   end
   
   def get_cropplanfield_info
     get_current_user
      @cpf = Cropplanfield.find_by_sql("Select cropplanfull,
                            crops.avg_yield_acre, crops.crop_inventory_uom 
     from cropplans cp
     join crops on cp.crop_id = crops.id

     where cp.user_id = #{@current_user.id } 
     and cp.id = #{session[:s_cropplan_id]}")
   end
   
   def get_fieldcropplan_info
     get_current_user
      @fcp = Field.find_by_sql("Select fieldname, number_acres
     from fields
     where user_id = #{@current_user.id } 
     and fields.id = #{session[:s_field_id]}")
   end
   
    def get_contracts()

    @contracts = Contract.find_by_sql("Select contracts.id,  partyname || ' ' || cropplanfull  as contractfull   
   from contracts 
   join parties on contracts.party_id = parties.id
   join cropplans on contracts.cropplan_id = cropplans.id
   where contracts.user_id = #{@current_user.id } ")
   end 
   
 
   
   def get_subscription_status()
      @subscription_status = Subscription.where('user_id' => @current_user.id)
   end
   
   def get_trial_days_left
     @user_trial = User.find(@current_user.id)
     if !@user_trial.nil? 
       @days_left = business_days_between(Date.parse(@user_trial.created_at.strftime('%Y/%m/%d')), Date.today)  
       @days_left = 30 - @days_left
     else
       @days_left = 7
     end
   end
   
   def business_days_between(date1, date2)
     business_days = 0
     date = date2
     while date > date1
      business_days = business_days + 1 unless date.saturday? or date.sunday?
      date = date - 1.day
     end
     business_days
   end
   
   
   def get_subscription_end_date
     @subscription = Subscription.find_by_user_id(@current_user.id)
     if !@subscription.nil? 
       @end_date = @subscription.start_date

     end
   end
   
   def subscription_valid?
      @subscription_status = Subscription.where('user_id' => @current_user.id)
      if @subscription_status.count == 0
        # determine if trial period is complete
        get_trial_days_left
        if @days_left <= 0
          return false
        else
          return true
        end
      else
        #see if subscription valid
        @subscription_status.each do |ss|
          
          @end_date = ss.start_date.next_year
          #logger.debug "AUTHENTICATE SUBSCRIPTION:- #{@end_date} - #{Date.today} "
          if Date.today > @end_date.strftime('%Y/%m/%d').to_date
            return false
          else
            return true
          end
      end
        
      end
     
   end
   
   
   def hours_to_service
     @to_service_hours = 0
     @equipment = Equipment.find(session[:s_equipment_id])
     @activity = Equipmentactivity.find_by_sql("Select activity_date
                                from equipmentactivities
                                where user_id = #{session[:s_user_id]}
                                and equipment_id = #{session[:s_equipment_id]}
                                and activity_type = 'full service'
                                order by activity_date desc
                                limit 1")
                              
     @activity.each do |a|  
       @activity_date = a.activity_date
     end
     
     if !@activity_date.nil?
         @farmjobequipment = Farmjobequipment.find_by_sql(" Select sum(qty_actual) as usage_hours
                                                 from farmjobequipments fje
                                                 join equipment eq on fje.equipment_id = eq.id
                                                 join farmjobs fj on fje.farmjob_id = fj.id
                                                 where fj.job_status = 'Job complete' 
                                                 and fje.user_id = #{@current_user.id}
                                                 and fje.equipment_id = #{session[:s_equipment_id]}
                                                 and start_date >= '#{@activity_date}'")
        @usage_hours = 0
        @farmjobequipment.each do |fe|
          @usage_hours += fe.usage_hours.to_f
        end
        #logger.debug "HOURS TO SERVICE CALCULATION:- #{@equipment.frequency_hours} - #{@usage_hours} "
        if @equipment.frequency_hours.nil? ||  @equipment.frequency_hours.blank?
           @frequency_hours = 0
        else
           @frequency_hours = @equipment.frequency_hours
        end
        @to_service_hours = @frequency_hours - @usage_hours
      else
        @to_service_hours = @frequency_hours 
    
      end
   end


   def get_cropplans_by_year()
    @cropplans = Cropplan.get_cropplan_index(@current_user.id)
   end
   
   def get_fields_by_farm()
     @fields = Field.where('user_id' => @current_user.id).order('farmname').all
   end
   
   def get_fields_by_farm_full()
     @fields =  Field.find_by_sql("Select fields.id, farmname || ' - ' || fieldname   || '  (' || number_acres  || '  ' || 'acres' || ' )' as fieldnamefull   
     from fields 
     where fields.user_id = #{@current_user.id } 
     order by farmname")
   end
   

    def get_fieldtasks_by_type()
      @fieldtasks = Fieldtask.get_fieldtasks_by_type(@current_user.id)
    end
    
    def get_farms
      get_current_user
      @farms = Farm.where('user_id' => @current_user.id).all
    end
    
    def get_micropost(id)
      @micropost = Micropost.find(id)
    end
    
    def get_comments(id)
     @comments =  Comment.find_by_sql("Select * from comments
                                       where micropost_id = #{id} 
                                       order by created_at desc")
  #    @comments = Comment.joins(:users).where("micropost_id = ?", id).all
  #     logger.debug "COMMENTS EXTRACT ********************:- #{@comments} "
    end
    
    def get_user(id)
      @user = User.find(id)
    end
    
    def get_countries
      @countries = Country.order(:id).all
    end
       
    def get_storage
      get_current_user
      @storages = Storage.where('user_id' => @current_user.id).all
    end

    def store_location
        session[:return_to] = request.fullpath      
    end
    
    def store_location_calendar
        session[:return_to] = '/calendar' + '/' + @year.to_s + '/' + @month .to_s    
    end
    
    def get_ztimes()
      @ztimes = Ztime.order('timekey').all
    end
  
  private
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
    

    
    def clear_return_to
        session[:return_to] = nil
    end
    
    def precision(num)
       number_with_precision(num, :precision => 2)
    end 
    
    

    
  
end
