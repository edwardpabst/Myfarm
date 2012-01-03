class Equipment < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :description, :user_id, :category, :make, :model, :year, :serial_number, :cost_unit, :cost_unit_hour , :rate_per_hour, :width, :photo_path, :frequency_hours
  
  belongs_to :Farmcrop
  belongs_to :Cropinventory
 
  	      
  validates_presence_of :description,  :category, :cost_unit, :cost_unit_hour , :rate_per_hour
end
