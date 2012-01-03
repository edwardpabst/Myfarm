class ChangeFarmjobIdFarmjob < ActiveRecord::Migration
  def self.up
 
    remove_column :farmjobs, :farmjob_id 
    
  end

  def self.down
  
   
 
  end
end
