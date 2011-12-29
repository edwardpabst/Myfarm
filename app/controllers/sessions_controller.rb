class SessionsController < ApplicationController
  
  def new
      @title = "Sign in" 
  end
  
  def create
    user = User.authenticate(params[:session] [:email],
                             params[:session] [:password])
                      
                             
    if user.nil?
      flash.now[:error] = "Invalid email/password combination"
      @title = "Sign in"
      render 'new'
    else
      # sign the user in and redirect to the users show page
      
      sign_in user
      redirect_back_or(user_path(user.id))
       #redirect_to(User, :action => "show" :id => @current_user.id )
    end
  end
  
  def destroy
    @title = "Sign in" 
    clear_return_to
    sign_out
    redirect_to  root_path
  end

end
