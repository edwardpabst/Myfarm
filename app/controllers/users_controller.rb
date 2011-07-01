class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
   
  def index
    @title = "All users"
    #@users = User.paginate(:page => params[:pagegem 'name', "1.0", :require => "name", :group => :test])
    @users = User.paginate(:page => params[:page], :per_page => 20)
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
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the User Authentication app"
      redirect_back_or @user
    else
      flash[:success] = "Invalid email/password combination"
      @title = "Sign up"
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  

  
  
  private 

    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless @current_user.admin?
    end

  
end
