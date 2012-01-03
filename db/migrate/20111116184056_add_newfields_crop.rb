class AddNewfieldsCrop < ActiveRecord::Migration
  def self.up
     
    add_column :crops, :seed_company_id, :integer
    add_column :crops, :variety_hybrid, :string
    add_column :crops, :lot_id, :string
    add_column :crops, :seed_rate_uom, :string
    add_column :crops, :seed_rate_land, :string
    add_column :crops, :seed_rate, :float
    add_column :crops, :plant_depth, :string
    add_column :crops, :crop_purpose, :string
    
 
  
   
  end

  def self.down
    remove_column :crops, :seed_company_id 
    remove_column :crops, :variety_hybrid 
    remove_column :crops, :lot_id, :string
    remove_column :crops, :seed_rate_uom 
    remove_column :crops, :seed_rate_land 
    remove_column :crops, :seed_rate 
    remove_column :crops, :plant_depth 
    remove_column :crops, :crop_purpose 
 
 
    
  end
end
