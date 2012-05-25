class Storage < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :name, :storage_type, :size, :size_uom, :location, :capacity, 
                  :capacity_uom, :yearly_cost, :is_supply_default
  

  has_many :inventorylots, :dependent => :restrict
  has_many :scaletickets, :dependent => :restrict
  has_many :podetails, :dependent => :restrict
  has_many :supplyinventories, :dependent => :restrict

 
  	      
  validates_presence_of :name, :storage_type, :location
  
end
