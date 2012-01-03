class ChangeFarmjobequipments < ActiveRecord::Migration
  def self.up
    remove_column :farmjobequipments, :qty_actaul
    add_column :farmjobequipments, :qty_actual, :float
    add_column :farmjobequipments, :cost_unit_hour, :float
    add_column :farmjobequipments, :rate_hour, :float
  
  end

  def self.down
    remove_column :farmjobequipments, :rate
  end
end
