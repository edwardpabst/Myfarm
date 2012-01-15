class Subscription < ActiveRecord::Base
  
  attr_accessible :name_on_card, :card_exp_month, :card_exp_year, :start_date, :status, :user_id, :card_last4,
                  :stripe_card_token, :stripe_customer_token, :address_line_1, :address_zip

 
  	      
  validates_presence_of :name_on_card, :card_exp_month, :card_exp_year, :start_date, :status, :user_id,
                        :stripe_card_token, :address_line_1, :address_zip
  
end
