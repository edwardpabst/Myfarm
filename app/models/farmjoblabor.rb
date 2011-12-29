class Farmjoblabor < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :farmjob_id, :party_id, :user_id,  :task_hours, :rate
  has_many :parties
  
       
        def self.profitability_labor_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)
          
            sql_statement = "Select partyname, partyjobtitle, 
                  sum(task_hours/applied_area) as qty_per_acre, 
                  avg(rate) as cost_per_unit, 
                  sum(rate * (task_hours/applied_area ))  as cost_per_acre 
             from farmjobs  
             join fields on farmjobs.field_id = fields.id
             join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
             join cropplans on farmjobs.cropplan_id = cropplans.id
             join farmjoblabors on farmjobs.id = farmjoblabors.farmjob_id
             join parties on farmjoblabors.party_id = parties.id
             where farmjobs.user_id = #{user_id}
             and fields.farm_id = #{farm_id}
             and start_date >= '#{start_date}'  
             and start_date <= '#{stop_date}' 
             and task_stage = '#{task_stage}'
             and plan_year = '#{year}'         
             group by partyname, partyjobtitle"            

          return Farmjobsupply.find_by_sql("#{sql_statement}")

        end
        def self.profitability_labor_summary(user_id, view, farm_id, year, start_date, stop_date)
          

            sql_statement = "Select  sum(task_hours/applied_area) as qty_per_acre, 
               avg(rate) as cost_per_unit, 
               sum(rate * (task_hours/applied_area ))  as cost_per_acre 
             from farmjobs  
             join fields on farmjobs.field_id = fields.id
             join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
             join cropplans on farmjobs.cropplan_id = cropplans.id
             join farmjoblabors on farmjobs.id = farmjoblabors.farmjob_id
             join parties on farmjoblabors.party_id = parties.id
             where farmjobs.user_id = #{user_id}
             and fields.farm_id = #{farm_id}
             and start_date >= '#{start_date}'  
             and start_date <= '#{stop_date}' 
             and plan_year = '#{year}'
             "            

          return Farmjobsupply.find_by_sql("#{sql_statement}")

        end
  
end
