class Supplyinventory < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :supply_id, :supply_uom, :user_id, :storage_id, :qty_in, :qty_onhand, :qty_out, 
                  :onhand_value, :avg_cost 
  
  belongs_to :Supply
  has_many :storages
 
 
end
