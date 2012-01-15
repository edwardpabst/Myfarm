class Equipment < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :description, :user_id, :category, :make, :model, :year, :serial_number, 
                  :cost_unit, :cost_unit_hour , :rate_per_hour, :width, :photo_path, :frequency_hours,
                  :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :photo

  
  has_many :farmjobequipments
  
  has_attached_file :photo, :styles => { :large=> "700x700>", :medium => "300x300>", :thumb => "120x120>" }
 
  	      
  validates_presence_of :description,  :category, :cost_unit, :cost_unit_hour , :rate_per_hour
end
