class Cropplanfield < ActiveRecord::Base
  
  attr_accessible :cropplan_id, :field_id, :plan_acres , :avg_yield 

  	     validates_presence_of :cropplan_id, :field_id, :plan_acres , :avg_yield   
  
  
  def self.validate_cropplanfield(cropplan_id, field_id)
                
               sql_statement = "Select *
                from cropplanfields
                where cropplan_id = #{cropplan_id} 
                and field_id = #{field_id} "            

           @cropplanfield =  Cropplanfield.find_by_sql("#{sql_statement}")
           if @cropplanfield.nil? or @cropplanfield.blank?
             return false
           else
             return true
           end
           
  end
  
end
