source 'http://rubygems.org'

gem 'rails', '3.0.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
# not used in heroku

  gem 'pg'
gem 'taps'

#web server for heroku
group :production do
  gem 'thin'
end

gem 'gravatar_image_tag', '0.1.0'
gem 'will_paginate', '3.0.pre2'
gem 'jquery-rails', '>= 1.0.3'
gem 'simple-navigation', '~> 3.3.3'
gem "gmaps4rails", "~> 1.3.0"
# gem 'ruport'
# gem 'acts_as_reportable'
# gem 'ruport-util'
gem 'prawn'
gem 'mail' 
gem 'stripe'
gem 'therubyracer', :require => nil
gem 'barista'
gem "paperclip", "~> 2.3"

gem 'rake' , '~> 0.9.2'
gem 'formtastic', '2.0.0.rc1'
gem 'event-calendar', :require => 'event_calendar'

# Use unicorn as the web server
# gem 'unicorn'

group :development do
  gem 'rspec-rails', '2.0.1'
  # gem 'annotate-models', '1.0.4'
  gem 'faker', '0.3.1'
end

group :test do
  gem 'rspec', '2.0.1'
  gem  'webrat'
  gem 'factory_girl_rails', '1.0'
end


# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'

# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
