class Farmjob < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :fieldtask_id, :field_id, :crop_id, :cropplan_id, :area_size,  :start_date, :stop_date, :start_time, :stop_time, :job_status , :workorder,
                  :total_hours, :notes, :equipment_id, :applied_area, :plan_rate, :actual_rate, :growth_stage, :application_method, :soil_condition,
                  :soil_type, :weather_segment, :eventname, :isreplicate, :from_farmjob_id, :has_been_completed,
                  :total_cost, :supply_cost, :labor_cost, :equipment_cost, :wind_direction,  :wind_speed, 
                  :temperature, :humidity, :sky_condition
                
  belongs_to :Fieldtask
  belongs_to :Crop
  belongs_to :Cropplan
  belongs_to :Field
  
  has_many :farmjobsupplies, :dependent => :destroy
  has_many :farmjoblabors, :dependent => :destroy
  has_many :farmjobequipments, :dependent => :destroy
  has_many :events, :dependent => :destroy
  
  has_many :supplies, :through => :farmjobsupplies 
  has_many :equipment, :through => :farmjobequipments
  has_many :parties, :through => :farmjoblabors
  belongs_to :User
 
  	     validates_presence_of :fieldtask_id, :field_id, :cropplan_id,  :job_status, :area_size, :start_date
  before_validation :set_date_time  
  
  #validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 10}
   validates :area_size, :format => { :with => /^\d+??(?:\.\d{0,2})?/ }, :numericality => {:greater_than => 0, :less_than => 5000}
   validates :applied_area, :format => { :with => /^\d+??(?:\.\d{0,2})?/ }, :numericality => {:greater_than => 0, :less_than => 5000}
   validates :total_hours, :format => { :with => /^\d+??(?:\.\d{0,2})?/ }, :numericality => {:greater_than => 0, :less_than => 5000}
      
         
         def set_date_time
           # Assuming date is your Date variable
            # self.start_time = self.start_time.change(:year => start_date.year, :day => start_date.day, :month => start_date.month)
           
         end
         
         def self.calculate_job_cost(jobid)
           
           @job = Farmjob.find(jobid)
           
           #calculate supply cost and billing
           @farmjobsupplies = Farmjob.find_by_sql(" Select farmjobsupplies.id, actual_qty, usage_uom,
                 supply_cost_uom, conversion_factor, supply_charge_uom
           from farmjobs  
           join farmjobsupplies on farmjobs.id = farmjobsupplies.farmjob_id
           join supplies on farmjobsupplies.supply_id = supplies.id 
           where farmjobs.id = #{jobid}")
           
           supply_cost = 0.0
           supply_billing = 0.0
           if !@farmjobsupplies.empty?
              @farmjobsupplies.each do |fjs|
                cost = fjs.supply_cost_uom.to_f
                charge = fjs.supply_charge_uom.to_f
                conversion = fjs.conversion_factor.to_f
                qty = fjs.actual_qty.to_f
                supply_cost += (cost / conversion) * qty
                supply_billing += (charge / conversion) * qty
              end
           else
             @job.supply_cost = 0
             @job.supply_billing = 0
           end
           
           @job.supply_cost = supply_cost
           @job.supply_billing = supply_billing
           
           #calculate labor cost
           @farmjoblabors = Farmjob.find_by_sql(" Select farmjoblabors.id, task_hours, rate, charge_hour
           from farmjobs  
           join farmjoblabors on farmjobs.id = farmjoblabors.farmjob_id
           join parties on farmjoblabors.party_id = parties.id 
           where farmjobs.id = #{jobid}")
           
           labor_cost = 0.0
           labor_billing = 0.0
           if !@farmjoblabors.empty?
              @farmjoblabors.each do |fjl|
                hours = fjl.task_hours.to_f
                rate = fjl.rate.to_f
                charge = fjl.charge_hour.to_f
                labor_cost += hours * rate
                labor_billing += hours * charge
              end
           else
             @job.labor_cost = 0
             @job.labor_billing = 0
           end
           
           @job.labor_cost = labor_cost
           @job.labor_billing = labor_billing
           
           #calculate equipment cost
           @farmjobequipments = Farmjob.find_by_sql(" Select farmjobequipments.id, qty_actual, 
           farmjobequipments.cost_unit_hour, farmjobequipments.additional_cost, farmjobequipments.rate_hour
           from farmjobs  
           join farmjobequipments on farmjobs.id = farmjobequipments.farmjob_id
           join equipment on farmjobequipments.equipment_id = equipment.id 
           where farmjobs.id = #{jobid}")
           
           
           equipment_cost = 0
           equipment_billing = 0
           if !@farmjobequipments.empty?
              @farmjobequipments.each do |fje|
                cost = fje.cost_unit_hour.to_f
                charge = fje.rate_hour.to_f
                qty = fje.qty_actual.to_f
                additional_cost = fje.additional_cost.to_f
                equipment_cost += (cost * qty) + additional_cost
                equipment_billing += (charge * qty) + additional_cost
              end
           else
             @job.equipment_cost = 0
             @job.equipment_billing = 0
           end
           
           @job.equipment_cost = equipment_cost
           @job.equipment_billing = equipment_billing
           @job.total_billing = supply_billing + labor_billing + equipment_billing
           @job.total_cost = supply_cost + labor_cost + equipment_cost
           
           @job.save
           
           
         end
 #-------------------------------------------------------------------------------------------------
 #-------- farmjob cost report -------------------------------------------------------------------  
 #-------------------------------------------------------------------------------------------------
 
         def self.farmjob_cost_by_field
           
           @farmjobs = Farmjob.find_by_sql("Select fieldname, sum(supply_cost) ,, sum(labor_cost), sum(equipment_cost), sum(total_cost)
           from farmjobs  
           join cropplans on farmjobs.cropplan_id = cropplans.id
           join crops on cropplans.crop_id = crops.id  
           join fields on farmjobs.field_id = fields.id 
           join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
           where farmjobs.user_id = #{session[:s_user_id]  } 
           group by fieldname
           order by fieldname")
           
         end
         
         def self.farmjob_cost_by_cropplan
           
           @farmjobs = Farmjob.find_by_sql("Select cropplanfull, sum(supply_cost) ,, sum(labor_cost), sum(equipment_cost), sum(total_cost)
           from farmjobs  
           join cropplans on farmjobs.cropplan_id = cropplans.id
           join crops on cropplans.crop_id = crops.id  
           join fields on farmjobs.field_id = fields.id 
           join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
           where farmjobs.user_id = #{session[:s_user_id]  } 
           group by cropplanfull
           order by cropplanfull")
           
         end
         
         def self.farmjob_cost
           
           @farmjobs = Farmjob.find_by_sql("Select sum(supply_cost) ,, sum(labor_cost), sum(equipment_cost), sum(total_cost)
           from farmjobs  
           join cropplans on farmjobs.cropplan_id = cropplans.id
           join crops on cropplans.crop_id = crops.id  
           join fields on farmjobs.field_id = fields.id 
           join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
           where farmjobs.user_id = #{session[:s_user_id]  }")
           
         end
         
         def self.farmjob_field_items(user_id, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence)
           
           sql_statement = "Select taskdescription, fieldname, cropplanfull, area_size, start_date, job_status,
             total_hours,  total_cost, supply_cost, labor_cost, equipment_cost
            from farmjobs  
            join cropplans on farmjobs.cropplan_id = cropplans.id
            join crops on cropplans.crop_id = crops.id  
            join fields on farmjobs.field_id = fields.id 
            join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
            where farmjobs.user_id = #{user_id}
            and start_date >= '#{start_date}'  
            and start_date <= '#{stop_date}' "
 
           sql = build_where_clause(sql_statement, fieldtask_id, field_id, cropplan_id, start_date, job_status, stop_date, sort_sequence )
                     
           return Farmjob.find_by_sql("#{sql}")

         end
     #farmjob summary    
         def self.farmjob_field_summary(user_id, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence)
           sql_statement = "Select sum(total_hours) as total_hours,  sum(total_cost) as total_cost, sum(supply_cost) as supply_cost, sum(labor_cost) as labor_cost, sum(equipment_cost) as equipment_cost
           from farmjobs 
           join fields   on farmjobs.field_id = fields.id 
            
           where farmjobs.user_id = #{user_id}
           and start_date >= '#{start_date}'  
           and start_date <= '#{stop_date}' "
           
           sql = build_summary_where_clause(sql_statement, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence )
            
           return Farmjob.find_by_sql("#{sql}")           
         end
         
         def self.build_where_clause(sql_statement, fieldtask_id, field_id, cropplan_id, start_date, job_status, stop_date, sort_sequence )
            
            if !fieldtask_id.nil? and !fieldtask_id.blank?
              fieldtask_select =  "and fieldtask_id = #{fieldtask_id}"
              sql_statement += fieldtask_select
            end
                       
           if !field_id.nil? and !field_id.blank?
             field_select =  " and field_id = #{field_id}"
             sql_statement += field_select
           end
           
           if !cropplan_id.nil? and !cropplan_id.blank?
             cropplan_select =  " and cropplan_id = #{cropplan_id}"
             sql_statement += cropplan_select
           end
           
           if !job_status.nil? and !job_status.blank?
             job_status_select =  " and job_status = '#{job_status}'"
             sql_statement += job_status_select
           end
           
           return sql_statement = sort_clauses(sql_statement, sort_sequence)
           
          
         end
         
         def self.build_summary_where_clause(sql_statement, fieldtask_id, field_id, cropplan_id, start_date, job_status, stop_date, sort_sequence )
            
            if !fieldtask_id.nil? and !fieldtask_id.blank?
              fieldtask_select =  "and fieldtask_id = #{fieldtask_id}"
              sql_statement += fieldtask_select
            end
                       
           if !field_id.nil? and !field_id.blank?
             field_select =  " and field_id = #{field_id}"
             sql_statement += field_select
           end
           
           if !cropplan_id.nil? and !cropplan_id.blank?
             cropplan_select =  " and cropplan_id = #{cropplan_id}"
             sql_statement += cropplan_select
           end
           
           if !job_status.nil? and !job_status.blank?
             job_status_select =  " and job_status = '#{job_status}'"
             sql_statement += job_status_select
           end
           
           return sql_statement
           
          
         end
         
         def self.sort_clauses(sql_statement, sort_sequence)
           if !sort_sequence.nil? and !sort_sequence.blank?
             if sort_sequence == 'field'
               sort_sequence = 'fieldname'
             elsif sort_sequence == 'crop'
               sort_sequence = 'cropplanfull'
             elsif sort_sequence == 'task'
               sort_sequence = "taskdescription"
             elsif sort_sequence == 'job_status'
               sort_sequence = 'job_status'
             elsif sort_sequence == 'date'
               sort_sequence = 'start_date'
             end
                           
             sort_sequence =  " order by  #{sort_sequence}"
             
           end
           
           return sql_statement += sort_sequence
           
         end
   #-------------------------------------------------------------------------------------------------
   #-------- farmjob billing report -------------------------------------------------------------------  
   #-------------------------------------------------------------------------------------------------
         def self.farmjob_billing_cost_by_client

           @farmjobs = Farmjob.find_by_sql("Select client_id, sum(supply_billing) , sum(labor_billing), sum(equipment_billing), sum(total_billing)
           from farmjobs  
           join cropplans on farmjobs.cropplan_id = cropplans.id
           join crops on cropplans.crop_id = crops.id  
           join fields on farmjobs.field_id = fields.id
           join parties on fields.client_id = parties.id  
           join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
           where farmjobs.user_id = #{session[:s_user_id]  } 
           group by client_id
           order by client_id")

         end
         
         def self.farmjob_billing_cost_by_farm

           @farmjobs = Farmjob.find_by_sql("Select farmname, sum(supply_billing) , sum(labor_billing), sum(equipment_billing), sum(total_billing)
           from farmjobs  
           join cropplans on farmjobs.cropplan_id = cropplans.id
           join crops on cropplans.crop_id = crops.id  
           join fields on farmjobs.field_id = fields.id
           join parties on fields.client_id = parties.id 
           join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
           where farmjobs.user_id = #{session[:s_user_id]  } 
           group by farmname
           order by farmname")

         end
                 def self.farmjob_billing_cost_by_field

                   @farmjobs = Farmjob.find_by_sql("Select fieldname, sum(supply_billing) , sum(labor_billing, sum(equipment_billing), sum(total_billing)
                   from farmjobs  
                   join cropplans on farmjobs.cropplan_id = cropplans.id
                   join crops on cropplans.crop_id = crops.id  
                   join fields on farmjobs.field_id = fields.id
                   join parties on fields.client_id = parties.id  
                   join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
                   where farmjobs.user_id = #{session[:s_user_id]  } 
                   group by fieldname
                   order by fieldname")

                 end

                 def self.farmjob_billing_cost_by_cropplan

                   @farmjobs = Farmjob.find_by_sql("Select cropplanfull, sum(supply_billing) , sum(labor_billing), sum(equipment_billing), sum(total_billing)
                   from farmjobs  
                   join cropplans on farmjobs.cropplan_id = cropplans.id
                   join crops on cropplans.crop_id = crops.id  
                   join fields on farmjobs.field_id = fields.id
                   join parties on fields.client_id = parties.id  
                   join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
                   where farmjobs.user_id = #{session[:s_user_id]  } 
                   group by cropplanfull
                   order by cropplanfull")

                 end

                 def self.farmjob_billing_cost

                   @farmjobs = Farmjob.find_by_sql("Select sum(supply_billing) , sum(labor_billing), sum(equipment_billing), sum(total_billing)
                   from farmjobs  
                   join cropplans on farmjobs.cropplan_id = cropplans.id
                   join crops on cropplans.crop_id = crops.id  
                   join fields on farmjobs.field_id = fields.id 
                   join parties on fields.client_id = parties.id 
                   left join parties on fields.client_id = parties.id 
                   join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
                   where farmjobs.user_id = #{session[:s_user_id]  }")

                 end

                 def self.farmjob_billing_items(user_id, client_id, farm_id, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence)

                   sql_statement = "Select partyname, farmname, taskdescription, fieldname, cropplanfull, area_size, start_date, job_status,
                     total_hours,  total_billing, supply_billing, labor_billing, equipment_billing
                    from farmjobs  
                    join cropplans on farmjobs.cropplan_id = cropplans.id
                    join crops on cropplans.crop_id = crops.id  
                    join fields on farmjobs.field_id = fields.id 
                    join parties on fields.client_id = parties.id 
                    join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
                    where farmjobs.user_id = #{user_id}
                    and start_date >= '#{start_date}'  
                    and start_date <= '#{stop_date}' "

                   sql = build_billing_where_clause(sql_statement, client_id, farm_id, fieldtask_id, field_id, cropplan_id, start_date, job_status, stop_date, sort_sequence )

                   return Farmjob.find_by_sql("#{sql}")

                 end
             #farmjob summary    
                 def self.farmjob_billing_summary(user_id, client_id, farm_id, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence)
                   sql_statement = "Select sum(total_hours) as total_hours,  sum(total_billing) as total_billing, 
                                    sum(supply_billing) as supply_billing, sum(labor_billing) as labor_billing, sum(equipment_billing) as equipment_billing
                   from farmjobs 
                   join fields   on farmjobs.field_id = fields.id 
                   join parties on fields.client_id = parties.id 
                   where farmjobs.user_id = #{user_id}
                   and start_date >= '#{start_date}'  
                   and start_date <= '#{stop_date}' "

                   sql = build_billing_summary_where_clause(sql_statement, client_id, farm_id, fieldtask_id, field_id, cropplan_id,  start_date, job_status, stop_date, sort_sequence )

                   return Farmjob.find_by_sql("#{sql}")           
                 end

                 def self.build_billing_where_clause(sql_statement, client_id, farm_id, fieldtask_id, field_id, cropplan_id, start_date, job_status, stop_date, sort_sequence )

                   if !client_id.nil? and !client_id.blank?
                     client_select =  "and client_id = #{client_id}"
                     sql_statement += client_select
                   end
                   
                   if !farm_id.nil? and !farm_id.blank?
                     ffarm_select =  "and farm_id = #{farm_id}"
                     sql_statement += farm_select
                   end
                   
                   
                    if !fieldtask_id.nil? and !fieldtask_id.blank?
                      fieldtask_select =  "and fieldtask_id = #{fieldtask_id}"
                      sql_statement += fieldtask_select
                    end

                   if !field_id.nil? and !field_id.blank?
                     field_select =  " and field_id = #{field_id}"
                     sql_statement += field_select
                   end

                   if !cropplan_id.nil? and !cropplan_id.blank?
                     cropplan_select =  " and cropplan_id = #{cropplan_id}"
                     sql_statement += cropplan_select
                   end

                   if !job_status.nil? and !job_status.blank?
                     job_status_select =  " and job_status = '#{job_status}'"
                     sql_statement += job_status_select
                   end

                   return sql_statement = sort_clauses(sql_statement, sort_sequence)


                 end

                 def self.build_billing_summary_where_clause(sql_statement, client_id, farm_id, fieldtask_id, field_id, cropplan_id, start_date, job_status, stop_date, sort_sequence )


                   if !client_id.nil? and !client_id.blank?
                     client_select =  "and client_id = #{client_id}"
                     sql_statement += client_select
                   end
                   
                   if !farm_id.nil? and !farm_id.blank?
                     ffarm_select =  "and farm_id = #{farm_id}"
                     sql_statement += farm_select
                   end

                    if !fieldtask_id.nil? and !fieldtask_id.blank?
                      fieldtask_select =  "and fieldtask_id = #{fieldtask_id}"
                      sql_statement += fieldtask_select
                    end

                   if !field_id.nil? and !field_id.blank?
                     field_select =  " and field_id = #{field_id}"
                     sql_statement += field_select
                   end

                   if !cropplan_id.nil? and !cropplan_id.blank?
                     cropplan_select =  " and cropplan_id = #{cropplan_id}"
                     sql_statement += cropplan_select
                   end

                   if !job_status.nil? and !job_status.blank?
                     job_status_select =  " and job_status = '#{job_status}'"
                     sql_statement += job_status_select
                   end

                   return sql_statement


                 end

                 def self.sort_clauses(sql_statement, sort_sequence)
                   if !sort_sequence.nil? and !sort_sequence.blank?
                     if sort_sequence == 'field'
                       sort_sequence = 'fieldname'
                     elsif sort_sequence == 'crop'
                       sort_sequence = 'cropplanfull'
                     elsif sort_sequence == 'task'
                       sort_sequence = "taskdescription"
                     elsif sort_sequence == 'job_status'
                       sort_sequence = 'job_status'
                     elsif sort_sequence == 'date'
                       sort_sequence = 'start_date'
                     end

                     sort_sequence =  " order by  #{sort_sequence}"

                   end

                   return sql_statement += sort_sequence

                 end
         
#-------------------------------------------------------------------------------------------------
#-------- profitability report -------------------------------------------------------------------  
#-------------------------------------------------------------------------------------------------
       
         def self.profitability_cost_items(user_id, view, farm_id, year, start_date, stop_date, task_stage)
           
             sql_statement = "Select taskdescription, sum(total_hours/applied_area) as total_hours_acre,               
                sum(labor_cost/applied_area) as labor_cost_acre,
                sum(equipment_cost/applied_area) as equipment_cost_acre, 
                sum(supply_cost/applied_area) as supply_cost_acre, 
                sum(total_cost/applied_area) as total_cost_acre
              from farmjobs  
              join fields on farmjobs.field_id = fields.id
              join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
              join cropplans on farmjobs.cropplan_id = cropplans.id
              where farmjobs.user_id = #{user_id}
              and fields.farm_id = #{farm_id}
              and start_date >= '#{start_date}'  
              and start_date <= '#{stop_date}' 
              and task_stage = '#{task_stage}'
              and plan_year = '#{year}'
          
              group by taskdescription"            
 
           return Farmjob.find_by_sql("#{sql_statement}")

         end
         def self.profitability_cost_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
           

             sql_statement = "Select sum(total_hours/applied_area) as total_hours_acre,               
                sum(labor_cost/applied_area) as labor_cost_acre,
                sum(equipment_cost/applied_area) as equipment_cost_acre, 
                sum(supply_cost/applied_area) as supply_cost_acre, 
                sum(total_cost/applied_area) as total_cost_acre
              from farmjobs 
              join fields on farmjobs.field_id = fields.id 
              join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
              join cropplans on farmjobs.cropplan_id = cropplans.id
              where farmjobs.user_id = #{user_id}
              and fields.farm_id = #{farm_id}
              and start_date >= '#{start_date}'  
              and start_date <= '#{stop_date}' 
              and task_stage = '#{task_stage}'
              and plan_year = '#{year}'
              "            

           return Farmjob.find_by_sql("#{sql_statement}")

         end
         
         def self.get_types_by_name(name, user_id)
          return Type.find_by_sql("Select type_value_string from types 
                                   where typename = 'task_stage'
                                   and user_id = #{user_id}
                                   order by type_value_integer")
         end
         
         def self.profitability_interest(user_id, view, farm_id, year, start_date, stop_date, task_stage)
          return Farmexpense.find_by_sql("Select expense_name,  (expense_amount/total_acres) as expense_amount_acre 
                                   from farmexpenses
                                   join farms on farmexpenses.farm_id = farms.id 
                                   where expense_type = 'interest'
                                   and expense_year = '#{year}'
                                   and farm_id = #{farm_id}
                                   and farmexpenses.user_id =  #{user_id}")
         end 
         
         def self.profitability_interest_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
          return Farmexpense.find_by_sql("Select   sum(expense_amount/total_acres) as expense_amount_acre 
                                   from farmexpenses
                                   join farms on farmexpenses.farm_id = farms.id 
                                   where expense_type = 'interest'
                                   and expense_year = '#{year}'
                                   and farm_id = #{farm_id}
                                   and farmexpenses.user_id =  #{user_id}")
         end
         
         def self.profitability_operating_cost(user_id, view, farm_id, year, start_date, stop_date, task_stage)

             sql_statement = "Select                
                sum(labor_cost/applied_area) as labor_cost_acre,
                sum(equipment_cost/applied_area) as equipment_cost_acre, 
                sum(supply_cost/applied_area) as supply_cost_acre, 
                sum(total_cost/applied_area) as total_cost_acre
              from farmjobs 
              join fields on farmjobs.field_id = fields.id 
              join fieldtasks on farmjobs.fieldtask_id = fieldtasks.id 
              join cropplans on farmjobs.cropplan_id = cropplans.id
              where farmjobs.user_id = #{user_id}
              and fields.farm_id = #{farm_id}
              and start_date >= '#{start_date}'  
              and start_date <= '#{stop_date}' 
              and plan_year = '#{year}'
              "            

         
          
           @operatingcost = Farmjob.find_by_sql("#{sql_statement}")
           #logger.debug "OPERATING COST PARAMS- #{Farmjob.inspect}"
           @interest = profitability_interest_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
           @total_interest = 0
           @total_acre = 0
           @interest.each do |i|
             expense_acre = i.expense_amount_acre.to_f
             @total_interest += expense_acre
           end
           @operatingcost.each do |o|
             @total_acre = o.total_cost_acre.to_f
             @total_acre += @total_interest
             o.total_cost_acre = @total_acre.to_s
           end
           return @operatingcost

         end
         
         def self.profitability_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage)
          return Farmexpense.find_by_sql("Select expense_name,  (expense_amount/total_acres) as expense_amount_acre 
                                   from farmexpenses
                                   join farms on farmexpenses.farm_id = farms.id 
                                   where expense_type = 'cash overhead'
                                   and expense_year = '#{year}'
                                   and farm_id = #{farm_id}
                                   and farmexpenses.user_id =  #{user_id}")
         end
         
         def self.profitability_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
          return Farmexpense.find_by_sql("Select sum(expense_amount/total_acres) as expense_amount_acre 
                                   from farmexpenses
                                   join farms on farmexpenses.farm_id = farms.id 
                                   where expense_type = 'cash overhead'
                                   and expense_year = '#{year}'
                                   and farm_id = #{farm_id}
                                   and farmexpenses.user_id =  #{user_id}")
         end
         
         def self.profitability_non_cash_overhead(user_id, view, farm_id, year, start_date, stop_date, task_stage)
          return Farmexpense.find_by_sql("Select expense_name,  (expense_amount/total_acres) as expense_amount_acre 
                                   from farmexpenses
                                   join farms on farmexpenses.farm_id = farms.id 
                                   where expense_type = 'non cash overhead'
                                   and expense_year = '#{year}'
                                   and farm_id = #{farm_id}
                                   and farmexpenses.user_id =  #{user_id}")
         end
         
         def self.profitability_non_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
          return Farmexpense.find_by_sql("Select sum(expense_amount/total_acres) as expense_amount_acre 
                                   from farmexpenses
                                   join farms on farmexpenses.farm_id = farms.id 
                                   where expense_type = 'non cash overhead'
                                   and expense_year = '#{year}'
                                   and farm_id = #{farm_id}
                                   and farmexpenses.user_id =  #{user_id}")
         end
         

         
         def self.profitability_total_cost_acre(user_id, view, farm_id, year, start_date, stop_date, task_stage)
           
           @cashoverhead_acre = 0
           @cashoverhead = profitability_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
           @cashoverhead.each do |o|
             @expense_total_acre = o.expense_amount_acre.to_f
             @cashoverhead_acre += @expense_total_acre
           end 
           @noncashoverhead_acre = 0
           @noncashoverhead = profitability_non_cash_overhead_summary(user_id, view, farm_id, year, start_date, stop_date, task_stage)
           @noncashoverhead.each do |o|
             @expense_total_acre = o.expense_amount_acre.to_f
             @noncashoverhead_acre += @expense_total_acre
           end          
     
           @operatingcost = profitability_operating_cost(user_id, view, farm_id, year, start_date, stop_date, task_stage)
            
           @operatingcost.each do |o|
             @total_acre = o.total_cost_acre.to_f
             @total_acre += @cashoverhead_acre 
             @total_acre +=  @noncashoverhead_acre
             o.total_cost_acre = @total_acre.to_s
            
           end
            
           
           return @operatingcost
           
         end
         
         def self.profitability_net_position(user_id, view, farm_id, year, start_date, stop_date, task_stage)         
     
           @operatingcost = profitability_total_cost_acre(user_id, view, farm_id, year, start_date, stop_date, task_stage)

           @operatingcost.each do |o|
             @total_acre = o.total_cost_acre.to_f          
           end
           
            
           @net_position = Shipment.profitability_revenue_summary(user_id, view, farm_id, year, start_date, stop_date)
           @net_position.each do |o|
             @total_revenue = o.value_per_acre.to_f
             @total_revenue -= @total_acre
             #logger.debug "REVENUE SUMMARY PARAMS- #{@net} revenue #{@total_revenue} cost #{@total_acre}"
             o.value_per_acre =  @total_revenue.to_s         
           end            
          
           return @net_position
           
         end
         
         def self.get_complete_job_data(id)

            @farmjob = Farmjob.find_by_sql("Select taskdescription, farmname, fieldname, cropplanfull,
                                        job_status, area_size, total_hours, start_date, notes
                                     from farmjobs fjs
                                     join fields fds on fjs.field_id = fds.id
                                     join cropplans cps on fjs.cropplan_id = cps.id
                                     join fieldtasks fts on fjs.fieldtask_id = fts.id
                                     
                                     where fjs.id =  #{id}")
            @farmjob.each do |farmjob|
              return farmjob
            end
  
 
         end
         


end
