
require 'faker'
namespace :db do
  desc "Fill database with sample microposts"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "ed.pabst",
                :email => "ed.pabst@yahoo.com",
                :password => "foobar",
                :password_confirmation => "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@yahoo.com"
      password = "password"
      User.create!(:name => name,
                  :email => email,
                  :password => password,
                  :password_confirmation => password)
    end
    
    User.all(:limit => 8).each do |user|
      50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5))
      end
    end
    
  end


end