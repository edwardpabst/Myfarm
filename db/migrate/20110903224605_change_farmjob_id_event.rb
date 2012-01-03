class ChangeFarmjobIdEvent < ActiveRecord::Migration
  def self.up
 
    add_column :events, :farmjob_id, :integer
      add_index :events, :farmjob_id
    
  end

  def self.down
  
    remove_column :events, :farmjob_id
 
  end
end
