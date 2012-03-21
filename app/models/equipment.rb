class Equipment < ActiveRecord::Base
  #acts_as_reportable
  attr_accessible :description, :user_id, :category, :make, :model, :year, :serial_number, 
                   :rate_per_hour, :width, :photo_path, :frequency_hours,
                  :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :photo, 
                  :cost_unit, :cost_unit_hour ,
                  :list_price, :purchase_price, :salvage_value , :life_years, :model_year, :purchase_year,
                  :hours_usage_year, :loan_amount, :interest_rate , :depreciation_year, :capital_recovery_year,
                  :capital_recovery_factor, :tax_amount, :insurance_amount , :housing_cost, :horsepower, :fuel_type

  
  has_many :farmjobequipments
  
  has_attached_file :photo, :styles => { :large=> "700x700>", :medium => "260x300>", :thumb => "120x120>" }
 
  	      
  validates_presence_of :description,  :category, :purchase_price, :cost_unit_hour , :hours_usage_year
  
  def self.depreciation_items(user_id, category)
    

      sql_statement = "Select (year || '-' ||description || ' ' || make || ' ' || model) as equipmentname, equipment.*
       from equipment
       where equipment.user_id = #{user_id} "            

       if   !category.nil? and !category.blank?
         sql_statement += " and category = '#{category}' "
       end 
       
    return Equipment.find_by_sql("#{sql_statement}")

  end
  
  def self.depreciation_item_summary(user_id, category)
    

      sql_statement = "Select sum(depreciation_year) as depreciation_year,
                              sum(capital_recovery_year) as capital_recovery_year,
                              sum(cost_unit) as cost_unit
       from equipment
       where equipment.user_id = #{user_id} "            

       if !category.nil? and !category.blank?
         sql_statement += " and category = '#{category}' "
       end 
       
    return Equipment.find_by_sql("#{sql_statement}")
  end
end
 