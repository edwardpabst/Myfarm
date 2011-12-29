class Cropplan < ActiveRecord::Base
  
  #acts_as_reportable
  attr_accessible :crop_id, :plan_year, :plan_status, :cropplanfull 
  
  has_many :crops
  has_many :farmjobs
 
 
  	     validates_presence_of :crop_id, :plan_year, :plan_status


         
         def self.get_cropplan_index(current_user_id)
           
           return @cropplans = Cropplan.find_by_sql("Select cropplans.id, cropplanfull, crop_id, plan_year, plan_status
           from cropplans
           where cropplans.user_id = #{current_user_id} 
           order by plan_year")
         end

end
