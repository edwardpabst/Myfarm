class ChangeTimesFarmjobAgain < ActiveRecord::Migration
  def self.up
    remove_column :farmjobs, :start_time
    remove_column :farmjobs, :stop_time
    add_column :farmjobs, :start_time, :string
    add_column :farmjobs, :stop_time, :string
  end

  def self.down
    remove_column :farmjobs, :start_time
    remove_column :farmjobs, :stop_time
 
  end
end
