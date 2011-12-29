class CreateEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.string :description
      t.integer :user_id
      t.string :category
      t.string :make
      t.string :model      
      t.string :year
      t.string :serial_number
      t.float :cost_unit
      t.float :cost_unit_hour
      t.float :cost_rate_hour
      t.float :width
      t.string :photo_path
      t.float :frequency_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment
  end
end
