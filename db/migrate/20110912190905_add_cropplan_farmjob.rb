class AddCropplanFarmjob < ActiveRecord::Migration
  def self.up
    add_column :farmjobs, :cropplan_id, :integer
    add_index :farmjobs, :cropplan_id  
  end

  def self.down
    remove_column :farmjobs, :cropplan_id
  end
end
