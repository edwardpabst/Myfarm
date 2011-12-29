class AddReplicationFarmjobs < ActiveRecord::Migration
  def self.up
     
    add_column :farmjobs, :isreplicate, :boolean
    add_column :farmjobs, :from_farmjob_id, :integer
   
  end

  def self.down
    remove_column :farmjobs, :isreplicate
    remove_column :farmjobs, :from_farmjob_id
    
  end
end
