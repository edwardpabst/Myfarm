class AddEquipmentcostsEquipment < ActiveRecord::Migration
  def self.up
    add_column :equipment, :list_price, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :purchase_price, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :salvage_value,  :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :life_years, :integer
    add_column :equipment, :model_year, :integer
    add_column :equipment, :purchase_year, :integer
    add_column :equipment, :hours_usage_year, :integer
    add_column :equipment, :loan_amount, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :interest_rate, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :depreciation_year, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :capital_recovery_year, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :capital_recovery_factor, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :tax_amount, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :insurance_amount, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :housing_cost, :decimal, { :scale => 2, :precision => 9 }
    add_column :equipment, :horsepower, :integer
    add_column :equipment, :fuel_type, :string
  end

  def self.down

    remove_column :equipment, :list_price 
    remove_column :equipment, :purchase_price 
    remove_column :equipment, :salvage_value 
    remove_column :equipment, :life_years 
    remove_column :equipment, :model_year 
    remove_column :equipment, :purchase_year 
    remove_column :equipment, :hours_usage_year 
    remove_column :equipment, :loan_amount 
    remove_column :equipment, :interest_rate 
    remove_column :equipment, :depreciation_year 
    remove_column :equipment, :capital_recovery_year 
    remove_column :equipment, :capital_recovery_factor 
    remove_column :equipment, :tax_amount, :decimal 
    remove_column :equipment, :insurance_amount 
    remove_column :equipment, :housing_cost  
    remove_column :equipment, :horsepower 
    remove_column :equipment, :fuel_type 
  end
end
