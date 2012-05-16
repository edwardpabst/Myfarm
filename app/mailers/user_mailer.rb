class UserMailer < ActionMailer::Base
  default :from => "customer.support@ifarmservice.com"
  
  def registration_confirmation(user)
    @user = user
   # attachments["seedling.jpg"] = File.read("/app/images/seedling.jpg") 
    mail(:to => "#{user.name} <#{user.email}>", :subject => "You have been Registered on iFarmService")

  end
  
  def subscription_confirmation(user)
    mail(:to => user.email, :subject => "Subscribed on iFarmService")
  end
  
  def subscription_to_expire(user)
    mail(:to => user.email, :subject => "iFarmService subscription soon to expire")
  end
  
  def support_message_confirmation(user)
    mail(:to => user.email, :subject => "We have received your support message at iFarmService")
  end
  
  
  def user_email_confirmation(user)
    mail(:to => user.email, :subject => "You have a message from another iFarmService farmer.")
  end
end

 
