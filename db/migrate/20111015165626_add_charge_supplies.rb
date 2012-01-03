class AddChargeSupplies < ActiveRecord::Migration
def self.up
  add_column :supplies, :supply_charge_uom, :float 
end

def self.down
  remove_column :supplies, :supply_charge_uom
end
end