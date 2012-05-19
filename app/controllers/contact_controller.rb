class ContactController < ApplicationController
    
  def new
    @message = Message.new
    get_current_user
  end

  def create
    @message = Message.new(params[:message])
    get_current_user

     
    if @message.valid?
      
      NotificationsMailer.new_message(@message, @current_user.name, @current_user.email).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end
  
end
