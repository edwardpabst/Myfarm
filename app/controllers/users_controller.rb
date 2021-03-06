class UsersController < ApplicationController
  
  before_filter :authenticate, :except => [:show, :new, :create, :admin, :admin_edit]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
   
  def index
    @title = "All Farmers"

     @users = User.find_by_sql("Select users.id, name, email, partycity, partystate   
     from users 
     left join parties on users.party_id = parties.id
     order by users.created_at").paginate(:page => params[:page], :per_page => 14)
  end
  
  def show
    
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def edit
    @title = "Edit user"
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end
  
  def create
    @user = User.new(params[:user])
    @coupon_code = true
    
    
    if !params[:coupon_code].nil? and !params[:coupon_code].blank?
       
      @coupon = Coupon.find_by_coupon_code(params[:coupon_code])
      if @coupon.nil?     
        @coupon_code = false
      else          
        @has_coupon = true
      end
    else        
      @has_coupon = false
    end 
    
    respond_to do |format|
    
      if @coupon_code == false          
         flash[:error] = "You have entered an invalid coupon code."             
      else
 
          if @user.save
            UserMailer.registration_confirmation(@user).deliver
            sign_in @user
            flash[:notice] = "Welcome to the iFarmService app. Please take a moment to complete your profile info before we begin to define your farm. Only field with * are required."
 
            if @has_coupon == true                          
              set_subscription       
            end
                  
            set_new_user_data
            
            format.html { redirect_to new_party_path }
          else
            @coupon_code = false
            @title = "Sign up"         
          end
    
      end
      
      format.html { render :action => "new" }
       
    end
    
    
     

  end
  
  def update
 
    #get email from params
    params[:user].each do |key, value| 
      if key == "email"
        @email = value
      elsif  key == "password"
          @password = value      
      elsif  key == "password_confirmation"
          @confirmation = value       
      end    
    end
     
     #logger.debug "USERPARAMS: #{params[:user].inspect}"
     #logger.debug "USER ID PARAM: #{params[:id]}"  
    @user = User.find(params[:id]) 

    @useremail = User.find_by_email(@email)
    
    if @useremail.nil? 

       if @password == @confirmation
          admin_update(@user)
        else
          
          flash[:error] = "Passwords do not match"
           redirect_to( :action => "edit", :id => @user.id)
        end
    elsif @useremail.email == @user.email
       if @password == @confirmation
          admin_update(@user)
        else
          flash[:error] = "Passwords do not match"
           redirect_to( :action => "edit", :id => @user.id)
        end
    else
      flash[:error] = "Email is already being used"
       redirect_to @user
    end
  end
  
  def admin
     #logger.debug "PARAMS #{params.inspect}"
     
     # extract paramaters for processing
     if !params[:user].nil?
           params[:user].each do |key, value| 
             if key == "email"
               @email = value
             elsif  key == "security_question"
                 @securityquestion = value      
             elsif  key == "security_answer"
                 @securityanswer = value    
             end    
           end

          if !@email.nil?
            admin_edit(@email,@securityquestion,@securityanswer)
          end
      end
    # render admin security page
  end
  
  def admin_edit(email,security_question,security_answer)
 
    @user = User.find_by_email(email)
    
    #logger.debug "USERPROFILE #{@user.attributes.inspect}"
    if @user.nil?
      flash[:error] = "This is an invalid Email."
      
    else
      if @user.security_question.nil?
        flash[:error] = "No security question was defined for this user. "
      else
    
        if @user.security_question.downcase.strip != security_question.downcase.strip
        #logger.debug "USERPROFILE STEP 1 #{@user.security_question.strip}, #{security_question.strip}"
          #@user.security_question = ""
          #@user.security_answer = ""
          flash[:error] = "Incorrect question/answer "
      
        elsif  @user.security_answer.downcase.strip != security_answer.downcase.strip

           #@user.security_question = ""
           #@user.security_answer = ""
          flash[:error] = "Incorrect question/answer "
       
        else
            # go change the password
       
            sign_in @user
            @title = "Edit user"
            redirect_to edit_user_path(@user.id)
  
        end
        
      end
    end
  end
  
  def admin_update(user)   
      if user.update_attributes(params[:user])

          sign_in user

        flash[:success] = "Profile updated"
        redirect_to user
      else
        @title = "Edit user"
        render 'edit'
        
      end

  end
  

  
  def following 
    @title = "Following"
    @user = User.find(params[:id])
    #@users = @user.following.paginate(:page => params[:page], :per_page => 20)
 
    @users = User.find_by_sql("Select users.id, users.name, email, partycity, partystate   
    from users 
    join relationships on users.id = relationships.followed_id
    left join parties on users.id = parties.system_user_id
    where relationships.follower_id = #{@user.id} ").paginate(:page => params[:page], :per_page => 14)
    render 'show_follow'
  end
  
  def followers 
    @title = "Followers"
    @user = User.find(params[:id])
    #@users = @user.followers.paginate(:page => params[:page], :per_page => 20)

    @users = User.find_by_sql("Select users.id, users.name, email, partycity, partystate   
    from users 
    join relationships on users.id = relationships.follower_id
    left join parties on users.id = parties.system_user_id
    where relationships.followed_id = #{@user.id} ").paginate(:page => params[:page], :per_page => 14)
    render 'show_follow'
  end
  
  def set_subscription 
    
    @subscription = Subscription.new
    @subscription.user_id = @user.id
    @subscription.start_date = Date.today
    @subscription.status = "coupon"
    @subscription.card_exp_month = nil
    @subscription.card_exp_year = nil
    @subscription.stripe_card_token = nil
    @subscription.card_last4 = nil
    @subscription.subscription_amount = (199 - @coupon.discount_amount)
    @subscription.coupon_code = params[:coupon_code]
    @subscription.expiration_date = Date.today + 1.years
    @subscription.name_on_card = "coupon"
    @subscription.card_exp_month = "coupon"
    @subscription.card_exp_year = "coupon"
    @subscription.stripe_card_token = "coupon"
    @subscription.address_line_1 = "coupon"
    @subscription.address_zip = "coupon"
    @subscription.save

  end
  

  
  
  private 

    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless get_current_user.admin?
    end

  
end
