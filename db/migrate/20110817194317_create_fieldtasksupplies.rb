class CreateFieldtasksupplies < ActiveRecord::Migration
  def self.up
    create_table :fieldtasksupplies do |t|
      t.integer :user_id
      t.integer :fieldtask_id
      t.integer :supply_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fieldtasksupplies
  end
end
