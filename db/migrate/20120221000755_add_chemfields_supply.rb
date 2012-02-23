class AddChemfieldsSupply < ActiveRecord::Migration
  def self.up
    add_column :supplies, :chemical_type, :string
    add_column :supplies, :active_ingredient, :string
    add_column :supplies, :chemical_rate_acre,  :decimal, { :scale => 2, :precision => 9 }
    add_column :supplies, :chemical_uom, :string
    add_column :supplies, :carrier_uom, :string
    add_column :supplies, :restricted_hours, :decimal, { :scale => 2, :precision => 9 }

    add_column :farmjobs, :wind_direction, :string
    add_column :farmjobs, :wind_speed, :string
    add_column :farmjobs, :temperature, :integer
    add_column :farmjobs, :humidity, :integer
    add_column :farmjobs, :sky_condition, :string
  end

  def self.down


    remove_column :supplies, :chemical_type 
    remove_column :supplies, :active_ingredient 
    remove_column :supplies, :chemical_rate_acre 
    remove_column :supplies, :chemical_uom  
    remove_column :supplies, :carrier_uom 
    remove_column :supplies, :restricted_hours 
    
    remove_column :farmjobs, :wind_direction 
    remove_column :farmjobs, :wind_speed 
    remove_column :farmjobs, :temperature  
    remove_column :farmjobs, :humidity  
    remove_column :farmjobs, :sky_condition  
  end
end
