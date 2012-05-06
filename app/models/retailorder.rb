class Retailorder < ActiveRecord::Base
  
  attr_accessible :source_user_id, :order_user_id, :order_date, :need_by_date, :coupon_code, :bill_address1,
          :bill_address2, :bill_city, :bill_state, :bill_postalcode, :bill_email,  :bill_phone,  :ship_address1,
          :ship_address2, :ship_city,   :ship_state, :ship_postalcode, :order_status, :order_total, :payment_method,
          :payment_id, :farm_id, :customername
     
     has_many :retailorderdetails
     validates_presence_of  :source_user_id, :order_user_id, :farm_id, :order_date, :bill_address1, :bill_city, 
                            :bill_state, :bill_postalcode, :bill_phone, :order_status
                            
   
end
