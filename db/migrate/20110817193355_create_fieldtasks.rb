class CreateFieldtasks < ActiveRecord::Migration
  def self.up
    create_table :fieldtasks do |t|
      t.integer :user_id
      t.string :task_type
      t.string :taskdescription
      t.string :task_notes
      t.integer :task_frequency_weeks
      t.integer :task_frequency_days

      t.timestamps
    end
  end

  def self.down
    drop_table :fieldtasks
  end
end
