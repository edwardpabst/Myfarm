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
         
         def self.get_cropplan_for_yield(user_id, cropplan_id, start_date, stop_date)
          
           sql_statement =  ("Select cp.id, cropplanfull
           from cropplans cp
           join scaletickets st on cp.id = st.cropplan_id
           where cp.user_id = #{user_id} ")
           
           sql_statement = build_where_clause(sql_statement, cropplan_id, "",  start_date, stop_date)
           sql_statement += " group by cp.id, cropplanfull"
           
           return @cropplans = Cropplan.find_by_sql(sql_statement)
           
           
         end
         
         def self.cropplan_yield_items(user_id, cropplan_id, field_id, start_date, stop_date)
           
          
           sql_statement = ("Select cropplanfull, fieldname, number_acres, avg_yield_acre, sum(st.pack_qty) / fields.number_acres as harvest_yield_acre,
                             ( ((sum(st.pack_qty/fields.number_acres) - avg_yield_acre) / avg_yield_acre) * 100) as percent_diff,
                             sum(pack_qty * price_per_uom) as total_revenue,  
                             sum((pack_qty * price_per_uom) / fields.number_acres) as revenue_acre, count(*) as count
           from cropplans cp
           join scaletickets st on cp.id = st.cropplan_id
           join crops on cp.crop_id = crops.id
           join fields on st.field_id_1 = fields.id
           where cp.user_id = #{user_id } 
           and cp.id = #{cropplan_id}")
          
           sql_statement = build_where_clause(sql_statement, cropplan_id, field_id,  start_date, stop_date)
           sql_statement += " group by cropplanfull, avg_yield_acre, fieldname, number_acres"
           
           return @cropyields = Cropplan.find_by_sql(sql_statement) 
         end
         
         def self.cropplan_yield_item_summary(user_id, id, start_date, stop_date)
           
          
           sql_statement = ("Select cropplanfull, avg_yield_acre, 
                             sum(st.pack_qty) / (sum(distinct (fields.number_acres + (field_id_1 * .01)))) as harvest_yield_acre,
                             ( (  ((sum(st.pack_qty) / (sum(distinct (fields.number_acres + (field_id_1 * .01))))) - avg_yield_acre)    / avg_yield_acre) * 100) as percent_diff,
                             sum(pack_qty * price_per_uom) as total_revenue,  
                             (sum(pack_qty * price_per_uom) /  (sum(distinct (fields.number_acres + (field_id_1 * .01))))) as revenue_acre
           from cropplans cp
           join scaletickets st on cp.id = st.cropplan_id
           join crops on cp.crop_id = crops.id
           join fields on st.field_id_1 = fields.id
           where cp.user_id = #{user_id } 
           and cp.id = #{id} ")
          
           sql_statement = build_where_clause(sql_statement, "", "",  start_date, stop_date)
           sql_statement += " group by cropplanfull, avg_yield_acre"
           return @cropyields = Cropplan.find_by_sql(sql_statement) 
         end
         
         def self.build_where_clause(sql_statement, cropplan_id, field_id,  start_date, stop_date)
            
            #if !cropplan_id.nil? and !cropplan_id.blank?
            #  cropplan_select =  "and cropplan_id = #{cropplan_id}"
            #  sql_statement += cropplan_select
            #end
                       
           if !field_id.nil? and !field_id.blank?
             field_select =  " and field_id_1 = #{field_id}"
             sql_statement += field_select
           end
          
             date_select =  " and tran_date >= '#{start_date}'"
             date_select +=  " and tran_date <= '#{stop_date}'"
             sql_statement += date_select
             
            
             return sql_statement
 

           
         end
end
