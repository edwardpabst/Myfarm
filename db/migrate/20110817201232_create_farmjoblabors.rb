class CreateFarmjoblabors < ActiveRecord::Migration
  def self.up
    create_table :farmjoblabors do |t|
      t.integer :user_id
      t.integer :farmjob_id
      t.integer :party_id
      t.float :task_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :farmjoblabors
  end
end
