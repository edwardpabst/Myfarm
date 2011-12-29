class AddUpdateflagFarmjob < ActiveRecord::Migration
  def self.up
     
    add_column :farmjobs, :has_been_completed, :boolean
  
   
  end

  def self.down
    remove_column :farmjobs, :has_been_completed
 
    
  end
end
