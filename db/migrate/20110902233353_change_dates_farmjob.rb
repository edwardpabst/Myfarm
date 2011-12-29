class ChangeDatesFarmjob < ActiveRecord::Migration
  def self.up
    remove_column :farmjobs, :start_date
    remove_column :farmjobs, :stop_date
    add_column :farmjobs, :start_date, :date
    add_column :farmjobs, :stop_date, :date
  end

  def self.down
    remove_column :farmjobs, :start_date
    remove_column :farmjobs, :stop_date
 
  end
end
