class ChangeagainTimesFarmjob < ActiveRecord::Migration
  def self.up
    remove_column :farmjobs, :start_time
    remove_column :farmjobs, :stop_time
    add_column :farmjobs, :start_time, :time
    add_column :farmjobs, :stop_time, :time
  end

  def self.down
    remove_column :farmjobs, :start_time
    remove_column :farmjobs, :stop_time
 
  end
end
