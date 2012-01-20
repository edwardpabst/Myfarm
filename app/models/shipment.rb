class Shipment < ActiveRecord::Base
 #acts_as_reportable
 
  attr_accessor  :ext_amt
  attr_accessible :user_id, :customer_id, :ship_date, :cropplan_id,   :contract_id,
                  :trucker_id, :trucker_name,
                  :manifest_id, :shipto_city,:shipto_state,:shipto_postalcode,:shipto_street,
                  :shipping_charge, :commission_amount, :broker_id, :ship_amount, :ship_status, :farm_id
  

  has_many :cropplans
  has_many :parties
  has_many :shipmentdetails , :dependent => :destroy
 
   
 
  	      
  validates_presence_of  :customer_id, :ship_date, :cropplan_id, :farm_id  


  def self.profitability_revenue(user_id, view, farm_id, year, start_date, stop_date)
    

      sql_statement = "Select cropplanfull, 
         sum(qty/number_acres) as qty_per_acre,               
         qty_uom,
         avg(price) as price_per_unit, 
         sum((price * qty) /number_acres) as value_per_acre
       from shipmentdetails sd
        join shipments sh on sd.shipment_id = sh.id
        join inventorylots il on sd.inventorylot_id = il.id
        join scaletickets st on il.scaleticket_id  = st.id
        left join fields on fields.id = st.field_id_1
        left join farms on fields.farm_id = farms.id
        join cropplans cp on sh.cropplan_id =  cp.id
       where sd.user_id = #{user_id}
       and fields.farm_id = #{farm_id}
       and ship_date >= '#{start_date}'  
       and ship_date <= '#{stop_date}' 
       and plan_year = '#{year}'
       group by cropplanfull, qty_uom, price
       "            

    return Shipment.find_by_sql("#{sql_statement}")

  end
  
  def self.profitability_revenue_summary(user_id, view, farm_id, year, start_date, stop_date)
    

      sql_statement = "Select  sum(qty/number_acres) as qty_per_acre,               
         (sum((price * qty) /number_acres)) / (sum(qty/number_acres))   as price_per_unit, 
         sum((price * qty) /number_acres) as value_per_acre
       from shipmentdetails sd
       join shipments sh on sd.shipment_id = sh.id
       join inventorylots il on sd.inventorylot_id = il.id
       join scaletickets st on il.scaleticket_id  = st.id
       join fields on fields.id = st.field_id_1
       join farms on fields.farm_id = farms.id
       join cropplans cp on sh.cropplan_id =  cp.id
       where sd.user_id = #{user_id}
       and fields.farm_id = #{farm_id}
       and ship_date >= '#{start_date}'  
       and ship_date <= '#{stop_date}' 
       and plan_year = '#{year}'
       "            

    return Shipment.find_by_sql("#{sql_statement}")

  end
end
