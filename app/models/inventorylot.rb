class Inventorylot < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :user_id, :scaleticket_id, :cropplan_id, :inventory_uom, :grade, :lab_report, :storage_id,  :qty_in,
    :qty_out_transfer,  :qty_out_ship,  :transfer_amount, :qty_onhand
  

  has_many :cropplans
  has_many :scaletickets
  has_many :storages
  
  
  
end
