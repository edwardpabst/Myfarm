class ChangeSupplyuomPodetail < ActiveRecord::Migration
  def self.up
    remove_column :podetails, :supply_uom
    add_column :podetails, :supply_uom, :string
  
   
  end

  def self.down
    remove_column :podetails, :supply_uom
 
    
  end
end
