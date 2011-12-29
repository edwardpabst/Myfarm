class AddColumnFarmjob < ActiveRecord::Migration
  def self.up

    add_column :farmjobs, :eventname, :string
  end

  def self.down
    remove_column :farmjobs, :eventname 
 
  end
end
