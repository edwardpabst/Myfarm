class AddTotalcostFarmjob < ActiveRecord::Migration
  def self.up
     
    add_column :farmjobs, :total_cost, :float
 
  
   
  end

  def self.down
    remove_column :farmjobs, :total_cost
 
 
    
  end
end
