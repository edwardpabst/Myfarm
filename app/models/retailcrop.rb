class Retailcrop < ActiveRecord::Base
  
  attr_accessible :cropplan_id, :user_id, :farm_id, :sales_price, :sales_uom, :sales_notes, :status, :available_date,
                  :ship_charge, :shipday1,  :shipday2, :shipday3, :shipday4, :shipday5, :shipday6, :shipday7,
                  :pickupday1, :pickupday2,:pickupday3,:pickupday4,:pickupday5,:pickupday6,:pickupday7
                  
  

  has_many :cropplans 
  validates_presence_of  :cropplan_id, :user_id, :farm_id, :sales_price, :sales_uom, :status, :available_date
  validates :sales_price, :numericality => true
 
end
