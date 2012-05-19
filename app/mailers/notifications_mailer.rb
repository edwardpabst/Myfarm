

class NotificationsMailer < ActionMailer::Base
  
 
#  default :from => "ed.pabst@yahoo.com"
  default :to => "customer.support@ifarmservice.com"

  def new_message(message, name, email)
    
    @message = message
   # mail(:subject => "#{message.subject}")
    mail(:from => "#{name} <#{email}>",:subject => "#{message.subject}", :body => "#{message.body}")
    
  end

end
