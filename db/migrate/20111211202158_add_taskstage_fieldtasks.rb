class AddTaskstageFieldtasks < ActiveRecord::Migration
  def self.up
      add_column :fieldtasks, :task_stage, :string
 
  end

  def self.down
    remove_column :fieldtasks, :task_stage
  end
end
