class AddDurationFieldtask < ActiveRecord::Migration
  def self.up
    add_column :fieldtasks, :task_duration_days, :integer  
    remove_column :fieldtasks, :task_frequency_weeks
  end

  def self.down
  end
end
