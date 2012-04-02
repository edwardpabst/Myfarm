class AddBillingFarmjobs < ActiveRecord::Migration
  def self.up
     
    add_column :farmjobs, :total_billing, :decimal, { :scale => 2, :precision => 9 }
    add_column :farmjobs, :supply_billing,  :decimal, { :scale => 2, :precision => 9 }
    add_column :farmjobs, :labor_billing,  :decimal, { :scale => 2, :precision => 9 }
    add_column :farmjobs, :equipment_billing,  :decimal, { :scale => 2, :precision => 9 }
  
   
  end

  def self.down
    remove_column :farmjobs, :total_billing
    remove_column :farmjobs, :supply_billing
    remove_column :farmjobs, :labor_billing
    remove_column :farmjobs, :equipment_billing
 
    
  end
end
