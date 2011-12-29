class ChangeFloatPrecisionSupplyinventory < ActiveRecord::Migration
  def self.up
    remove_column :supplyinventories, :onhand_value
    remove_column :supplyinventories, :avg_cost
     add_column :supplyinventories, :onhand_value, :float, :precision => '2'
     add_column :supplyinventories, :avg_cost, :float, :precision => '2'
  end

  def self.down
  end
end
