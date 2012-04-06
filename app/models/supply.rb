class Supply < ActiveRecord::Base
 # acts_as_reportable
  attr_accessible :supplyname, :item_number, :supply_type, :supply_uom, :supply_cost_uom, :supply_charge_uom,
  :distribution_uom, :rate_acre, :epa_id, :manufacturer, :formulation, 
                  :carrier, :carrier_rate_acre, :problem_target, :conversion_factor,
                  :nitrogen_content, :phosphorous_content,  :potassium_content, :calcium_content,
                  :manganese_content, :magnesium_content,  :chemical_type,  :active_ingredient, 
                  :chemical_rate_acre, :chemical_uom , :carrier_uom,  :restricted_hours
  belongs_to :Farmjob
  has_many :fieldtasksupplies, :dependent => :destroy
  has_many :fieldtasks, :through => :fieldtasksupplies
 
  	      
  validates_presence_of :supplyname, :item_number, :supply_type, :supply_uom, :supply_cost_uom
  validates :supply_cost_uom, :numericality => true 
  validates :supply_charge_uom, :numericality => true 
  validates :carrier_rate_acre, :numericality => true 
  validates :rate_acre, :numericality => true 
  validates :conversion_factor, :numericality => true
  
  validates :nitrogen_content, :numericality => true
  validates :phosphorous_content, :numericality => true 
  validates :potassium_content, :numericality => true 
  validates :calcium_content, :numericality => true 
  validates :manganese_content, :numericality => true 
  validates :magnesium_content, :numericality => true 
  validates :chemical_rate_acre, :numericality => true 
  validates :restricted_hours, :numericality => true  
  
          def supplyfull
            "#{self.supplyname}: #{self.supply_uom}"
          end
          
          def self.get_supply_for_fertilizer(user_id, job_status, start_date, stop_date)

            sql_statement =  ("Select supplies.id, supplyname
            from farmjobsupplies fjs
            join farmjobs fj on fjs.farmjob_id = fj.id
            join supplies on fjs.supply_id = supplies.id
            where fjs.user_id = #{user_id} 
            and supplies.supply_type = 'fertilizer' ")
             
            sql_statement = build_where_clause(sql_statement, "", job_status,  start_date, stop_date)

            sql_statement += " group by supplies.id, supplyname " 

            return @supply_fertilizer = Supply.find_by_sql(sql_statement)

          end
          
          
          def self.get_supply_for_chemical(user_id, job_status, start_date, stop_date)

            sql_statement =  ("Select supplies.id, supplyname, active_ingredient, formulation, restricted_hours
            from farmjobsupplies fjs
            join farmjobs fj on fjs.farmjob_id = fj.id
            join supplies on fjs.supply_id = supplies.id
            where fjs.user_id = #{user_id} 
            and supplies.supply_type = 'restricted use' ")
             
            sql_statement = build_where_clause(sql_statement, "", job_status,  start_date, stop_date)

            sql_statement += " group by supplies.id, supplyname, active_ingredient, formulation, restricted_hours " 

            return @supply_fertilizer = Supply.find_by_sql(sql_statement)

          end
          
         
         def self.build_where_clause(sql_statement, supply_id, job_status,  start_date, stop_date)
             #logger.debug "SUPPLY FERTILIZER SUPPLY ID- #{supply_id}"
            if !supply_id.nil? and !supply_id.blank?
              supply_select =  "and supply_id = #{supply_id}"
              sql_statement += supply_select
            end
                       
           if !job_status.nil? and !job_status.blank?
             status_select =  " and job_status = '#{job_status}'"
             sql_statement += status_select
           end
          
             date_select =  " and start_date >= '#{start_date}'"
             date_select +=  " and start_date <= '#{stop_date}'"
             sql_statement += date_select
                        
             return sql_statement
           
         end
         

         def self.supply_fertilizer_items(user_id, supply_id, job_status, start_date, stop_date)
           
          
           sql_statement = ("Select fieldname, applied_area, start_date, rate_acre, distribution_uom, (applied_area * rate_acre) as total_usage, 
            ((nitrogen_content *  rate_acre) / 100 ) as nit_usage, 
            ((phosphorous_content *  rate_acre) / 100 ) as phos_usage, 
            ((potassium_content *  rate_acre) / 100 ) as pot_usage, 
            ((calcium_content *  rate_acre) / 100 ) as ca_usage, 
            ((manganese_content *  rate_acre) / 100 ) as mn_usage, 
            ((magnesium_content *  rate_acre) / 100 ) as mg_usage
           from supplies su
           join farmjobsupplies fjs on su.id = fjs.supply_id
           join farmjobs fj on fjs.farmjob_id = fj.id
           left join fields on fj.field_id = fields.id
           where su.user_id = #{user_id } ")
          
           sql_statement = build_where_clause(sql_statement, supply_id, job_status,  start_date, stop_date)
           sql_statement += " order by fieldname, start_date"
            return @supplyfertilizer = Supply.find_by_sql(sql_statement) 

         end
         
         def self.supply_fertilizer_summary(user_id, supply_id, job_status, start_date, stop_date)
           
          
           sql_statement = ("Select sum ( (applied_area * rate_acre)) as total_usage, 
            sum (  ((nitrogen_content *  rate_acre) / 100 )) as nit_usage, 
            sum ( ((phosphorous_content *  rate_acre) / 100 )) as phos_usage, 
            sum ( ((potassium_content *  rate_acre) / 100 )) as pot_usage, 
            sum ( ((calcium_content *  rate_acre) / 100 )) as ca_usage, 
            sum ( ((manganese_content *  rate_acre) / 100 )) as mn_usage, 
            sum ( ((magnesium_content *  rate_acre) / 100 )) as mg_usage
           from supplies su
           join farmjobsupplies fjs on su.id = fjs.supply_id
           join farmjobs fj on fjs.farmjob_id = fj.id
           left join fields on fj.field_id = fields.id
           where su.user_id = #{user_id } ")
          
           sql_statement = build_where_clause(sql_statement, supply_id, job_status,  start_date, stop_date)
           
           return @supplyfertilizer = Supply.find_by_sql(sql_statement) 
           
         end
         
         
         def self.supply_chemical_items(user_id, supply_id, job_status, start_date, stop_date)
           
          
           sql_statement = ("Select cropplanfull, fieldname, applied_area, start_date, rate_acre, distribution_uom, 
           (applied_area * rate_acre) as chemical_usage, carrier_rate_acre, carrier_uom, 
            (applied_area * carrier_rate_acre) as carrier_usage, growth_stage, soil_type, sky_condition,
            wind_direction, wind_speed, temperature, humidity
           
           from supplies su
           join farmjobsupplies fjs on su.id = fjs.supply_id
           join farmjobs fj on fjs.farmjob_id = fj.id
           join cropplans cp on fj.cropplan_id = cp.id
           left join fields on fj.field_id = fields.id
           where su.user_id = #{user_id } ")
          
           sql_statement = build_where_clause(sql_statement, supply_id, job_status,  start_date, stop_date)
           sql_statement += " order by fieldname, start_date"
            return @supplyfertilizer = Supply.find_by_sql(sql_statement) 

         end
         
         def self.supply_chemical_summary(user_id, supply_id, job_status, start_date, stop_date)
           
          
           sql_statement = ("Select  sum(applied_area) as applied_area, sum((applied_area * rate_acre)) as chemical_usage,  
             sum((applied_area * carrier_rate_acre)) as carrier_usage
           from supplies su
           join farmjobsupplies fjs on su.id = fjs.supply_id
           join farmjobs fj on fjs.farmjob_id = fj.id
           left join fields on fj.field_id = fields.id
           where su.user_id = #{user_id } ")
          
           sql_statement = build_where_clause(sql_statement, supply_id, job_status,  start_date, stop_date)
           
           return @supplyfertilizer = Supply.find_by_sql(sql_statement) 
           
         end
         
end
