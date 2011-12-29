class CreateFarmjobsupplies < ActiveRecord::Migration
  def self.up
    create_table :farmjobsupplies do |t|
      t.integer :user_id
      t.integer :farmjob_id
      t.integer :supply_id
      t.float :actual_qty

      t.timestamps
    end
  end

  def self.down
    drop_table :farmjobsupplies
  end
end
