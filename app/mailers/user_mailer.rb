class UserMailer < ActionMailer::Base
  default :from => "ed.pabst@yahoo.com"
  
  def registration_confirmation(user)
    @user = user
     attachments["farming7.jpg"] = File.read("#{Rails.root}/public/images/farming7.jpg") 
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered on iFarmService")

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
end
