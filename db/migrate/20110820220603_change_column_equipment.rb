class ChangeColumnEquipment < ActiveRecord::Migration
  def self.up
    remove_column :equipment, :cost_rate_hour
    add_column :equipment, :rate_per_hour, :float
  end

  def self.down
  end
end
