class Storage < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :name, :storage_type, :size, :size_uom, :location, :capacity, 
                  :capacity_uom, :yearly_cost, :is_supply_default
  

  has_many :inventorylots

 
  	      
  validates_presence_of :name, :storage_type, :location
  
end
