class DatetimeFarmjobs < ActiveRecord::Migration
  def self.up
    remove_column :farmjobs, :start_time
    remove_column :farmjobs, :stop_time
    add_column :farmjobs, :start_time, :datetime
    add_column :farmjobs, :stop_time, :datetime
  end

  def self.down
    remove_column :farmjobs, :start_time
    remove_column :farmjobs, :stop_time
 
  end
end
