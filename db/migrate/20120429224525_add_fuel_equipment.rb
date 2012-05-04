class AddFuelEquipment < ActiveRecord::Migration
  def self.up
     
     add_column :equipment, :usage_qty_hour, :decimal
     add_column :equipment, :supply_id, :integer
     

  end

  def self.down

    remove_column :equipment, :usage_qty_hour
    remove_column :equipment, :supply_id
    
  
  end
end
