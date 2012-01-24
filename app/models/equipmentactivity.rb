class Equipmentactivity < ActiveRecord::Base
#acts_as_reportable
  attr_accessible :activity, :activity_date, :equipment_id, :user_id, :service_cost, :activity_type, :service_notes
  
   validates_presence_of :activity, :activity_date
end
