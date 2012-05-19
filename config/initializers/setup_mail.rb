# ActionMailer::Base.smtp_settings = {
#  :address              => "smtpout.secureserver.net",
#  :port                 => 465,
#  :domain               => "www.ifarmservice.com",
#  :user_name            => "customer.support",
#  :password             => "bubble2",
#  :authentication       => "plain",
#  :enable_starttls_auto => true
# }

# ActionMailer::Base.default_url_options[:host] = "www.ifarmservice.com"

#--------------------------------------------------------------
 ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => "app2615320@heroku.com",
  :password       => "l1oeawmv",
  :domain         => 'heroku.com'
 }
 ActionMailer::Base.delivery_method = :smtp

#--------------------------------------------------------------
# ActionMailer::Base.smtp_settings = {
#  :address              => "smtp.gmail.com",
#  :port                 => 587,
#  :domain               => "ifarmservice.com",
#  :user_name            => "edwardjpabst@gmail.com",
#  :password             => "Hellabor0u2",
#  :authentication       => :plain,
#  :enable_starttls_auto => true
#}

# ActionMailer::Base.default_url_options[:host] = "www.ifarmservice.com"
# ActionMailer::Base.delivery_method = :smtp
