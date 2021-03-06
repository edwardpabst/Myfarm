class Farmjobequipment < ActiveRecord::Base
#acts_as_reportable

attr_accessible :farmjob_id, :equipment_id, :user_id,  :qty_required, :qty_actual, :additional_cost, 
                :cost_unit_hour, :rate_hour, :farmjobsupply_id

      def self.profitability_equipment_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)
        
          sql_statement = "Select description, make, model, year, 
                sum(qty_actual/applied_area) as qty_per_acre, 
                avg(equipment.cost_unit_hour) as cost_per_unit, 
                sum(equipment.cost_unit_hour * (qty_actual/applied_area ))  as cost_per_acre 
           from farmjobs  
           join fields on farmjobs.field_id = fields.id
           join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
           left join cropplans on farmjobs.cropplan_id = cropplans.id and plan_year = '#{year}'  
           join farmjobequipments on farmjobs.id = farmjobequipments.farmjob_id
           join equipment on farmjobequipments.equipment_id = equipment.id
           where farmjobs.user_id = #{user_id}
           and fields.farm_id = #{farm_id}
           and start_date >= '#{start_date}'  
           and start_date <= '#{stop_date}' 
           and task_stage = '#{task_stage}'
                  
           group by description, make, model, year"            

        return Farmjobequipment.find_by_sql("#{sql_statement}")

      end
      def self.profitability_equipment_summary(user_id, view, farm_id, year, start_date, stop_date)
        

        sql_statement = "Select 
              sum(qty_actual/applied_area) as qty_per_acre, 
              avg(equipment.cost_unit_hour) as cost_per_unit, 
              sum(equipment.cost_unit_hour * (qty_actual/applied_area ))  as cost_per_acre 
         from farmjobs  
         join fields on farmjobs.field_id = fields.id
         join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
         left join cropplans on farmjobs.cropplan_id = cropplans.id  and plan_year = '#{year}'   
         join farmjobequipments on farmjobs.id = farmjobequipments.farmjob_id
         join equipment on farmjobequipments.equipment_id = equipment.id
         where farmjobs.user_id = #{user_id}
         and fields.farm_id = #{farm_id}
         and start_date >= '#{start_date}'  
         and start_date <= '#{stop_date}'               
         "            

        return Farmjobequipment.find_by_sql("#{sql_statement}")

      end
end
