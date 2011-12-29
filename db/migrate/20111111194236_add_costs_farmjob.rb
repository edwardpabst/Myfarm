class AddCostsFarmjob < ActiveRecord::Migration
  def self.up
     
    add_column :farmjobs, :supply_cost, :float
    add_column :farmjobs, :labor_cost, :float
    add_column :farmjobs, :equipment_cost, :float
  
   
  end

  def self.down
    remove_column :farmjobs, :supply_cost
    remove_column :farmjobs, :labor_cost
    remove_column :farmjobs, :equipment_cost
 
    
  end
end
