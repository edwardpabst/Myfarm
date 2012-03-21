class ChangeCosthourEquipment < ActiveRecord::Migration
  def self.up
    change_column :equipment, :cost_unit, :decimal, { :scale => 2, :precision => 9 }
    change_column :equipment, :cost_unit_hour, :decimal, { :scale => 2, :precision => 9 }
  end

  def self.down
  end
end
