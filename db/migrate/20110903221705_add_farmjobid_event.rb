class AddFarmjobidEvent < ActiveRecord::Migration
  def self.up
 
    add_column :farmjobs, :farmjob_id, :integer
    
  end

  def self.down
  
    remove_column :farmjobs, :farmjob_id
 
  end
end
