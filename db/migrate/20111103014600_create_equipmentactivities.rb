class CreateEquipmentactivities < ActiveRecord::Migration
  def self.up
    create_table :equipmentactivities do |t|
      t.integer :equipment_id
      t.integer :user_id
      t.string :activity
      t.date :activity_date
      t.float :service_cost
      t.string :service_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :equipmentactivities
  end
end
