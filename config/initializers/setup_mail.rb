ActionMailer::Base.smtp_settings = {
  :address              => "smtpout.secureserver.net",
  :port                 => 465,
  :domain               => "www.ifarmservice.com",
  :user_name            => "customer.support",
  :password             => "bubble2",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "www.ifarmservice.com"

