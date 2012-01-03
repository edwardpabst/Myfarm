module SessionsHelper
  
  

  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    @current_user = user 
    set_current_user_data
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
  end
  
  def set_current_user_data
    get_current_user
    set_current_parms
    session[:s_is_new_user] = false
  end
  
  def set_current_parms
    session[:s_user_id] = @current_user.id
    session[:s_user_name] = @current_user.name
    session[:s_user_email] = @current_user.email
  end

  
  def sign_out
    cookies.delete(:remember_token)
    @current_user = nil
    session[:s_user_id] = nil
    session[:s_user_name] = nil
    session[:s_user_email] = nil
    session[:s_is_new_user] = nil
    session[:email] = nil
    session[:password] = nil
  end
  
  
  def authenticate
     # logger.debug "AUTHENTICATE:- #{@current_user.inspect} -"
      deny_access unless signed_in?
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
   @types = Type.where('typename' => name, 'user_id' => @current_user.id).order('type_value_string').all
  end
  
  def get_types_by_name_0(name)
   @types = Type.where('typename' => name).order('type_value_string').all
  end
  
  def get_supplies_by_type()
   @supplies = Supply.where('user_id' => @current_user.id).order('supply_type').all
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
      and partytypes.typecode in ('EMPL', 'LBRMACH', 'LBRNON')")
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
   
   def get_contracts()
 
      @contracts = Contract.find_by_sql("Select contracts.id,  partyname || ' ' || cropplanfull  as contractfull   
     from contracts 
     join parties on contracts.party_id = parties.id
     join cropplans on contracts.cropplan_id = cropplans.id
     where contracts.user_id = #{@current_user.id } ")
   end

   def get_cropplans_by_year()
    get_current_user
    @cropplans = Cropplan.get_cropplan_index(@current_user.id)
   end
   
   def get_fields_by_farm()
     @fields = Field.where('user_id' => @current_user.id).order('farmname').all
   end
    
    def get_fieldtasks_by_type()
    @fieldtasks = Fieldtask.find_by_sql("Select id, task_stage || ' - ' || taskdescription  as taskfull   
     from fieldtasks 
     where fieldtasks.user_id = #{@current_user.id }
     order by task_stage desc")
    end
    
    def get_farms
      get_current_user
      @farms = Farm.where('user_id' => @current_user.id).all
    end
    
    def get_storage
      get_current_user
      @storages = Storage.where('user_id' => @current_user.id).all
    end

    def store_location
        session[:return_to] = request.fullpath
     
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
