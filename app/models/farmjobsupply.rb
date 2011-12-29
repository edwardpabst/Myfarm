class Farmjobsupply < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :farmjob_id, :supply_id, :user_id,  :actual_qty, :usage_uom
  has_many :supplies
  
  def self.decrement_supply_inventory(jobid)
    @farmjobsupplies = Farmjob.find_by_sql(" Select farmjobsupplies.id, farmjobsupplies.supply_id, actual_qty, usage_uom,
          supply_cost_uom, conversion_factor
    from farmjobs  
    join farmjobsupplies on farmjobs.id = farmjobsupplies.farmjob_id
    join supplies on farmjobsupplies.supply_id = supplies.id 
    where farmjobs.id = #{jobid}")
    
    
    if !@farmjobsupplies.empty?
       @farmjobsupplies.each do |fjs|
         #update supplies inventory
         @supplyinventory = Supplyinventory.find_by_supply_id(fjs.supply_id)
         if @supplyinventory.nil? || @supplyinventory.blank?
           @supplyinventory = Supplyinventory.new
           @supplyinventory.qty_onhand = 0
           @supplyinventory.qty_out = 0
           @supplyinventory.onhand_value = 0
           @supplyinventory.avg_cost = 0
           @supplyinventory.supply_id = fjs.supply_id
         end
         logger.debug "FARMJOBSUPPLY INVENTORY ***** #{@supplyinventory.inspect}"
         qty = fjs.actual_qty.to_f
         conversion = fjs.conversion_factor.to_f
         cost = fjs.supply_cost_uom.to_f
         @supplyinventory.qty_onhand -= (qty / conversion) 
         @supplyinventory.qty_out += (qty / conversion)  
         @supplyinventory.onhand_value -= (qty / conversion) * cost
         @supplyinventory.avg_cost = @supplyinventory.onhand_value / @supplyinventory.qty_onhand
         @supplyinventory.save
         #write inventory transaction record
         SupplyinventoryTran.addtransaction('farmjob_complete', @supplyinventory.id,  fjs.id, (qty / conversion), ((qty / conversion) * cost))
       end
    end
  end
  
         
         def self.profitability_supply_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)
           
             sql_statement = "Select supplyname, sum(actual_qty/applied_area) as qty_per_acre,               
                usage_uom,
                sum(supply_cost_uom / conversion_factor) as cost_per_unit, 
                sum((supply_cost_uom / conversion_factor) * (actual_qty/applied_area ))  as cost_per_acre 
              from farmjobs  
              join fields on farmjobs.field_id = fields.id
              join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
              join cropplans on farmjobs.cropplan_id = cropplans.id
              join farmjobsupplies on farmjobs.id = farmjobsupplies.farmjob_id
              join supplies on farmjobsupplies.supply_id = supplies.id
              where farmjobs.user_id = #{user_id}
              and fields.farm_id = #{farm_id}
              and start_date >= '#{start_date}'  
              and start_date <= '#{stop_date}' 
              and task_stage = '#{task_stage}'
              and plan_year = '#{year}'         
              group by supplyname, usage_uom"            
 
           return Farmjobsupply.find_by_sql("#{sql_statement}")

         end
         def self.profitability_supply_summary(user_id, view, farm_id, year, start_date, stop_date)
           

             sql_statement = "Select sum(actual_qty/applied_area) as qty_per_acre,               
                             sum((supply_cost_uom / conversion_factor) /applied_area) as cost_per_unit, 
                             sum(((supply_cost_uom / conversion_factor) / applied_area) * actual_qty)  as cost_per_acre
              from farmjobs 
              join fields on farmjobs.field_id = fields.id 
              join cropplans on farmjobs.cropplan_id = cropplans.id
              join farmjobsupplies on farmjobs.id = farmjobsupplies.farmjob_id
              join supplies on farmjobsupplies.supply_id = supplies.id
              where farmjobs.user_id = #{user_id}
              and fields.farm_id = #{farm_id}
              and start_date >= '#{start_date}'  
              and start_date <= '#{stop_date}' 
              and plan_year = '#{year}'
              "            

           return Farmjobsupply.find_by_sql("#{sql_statement}")

         end
end
