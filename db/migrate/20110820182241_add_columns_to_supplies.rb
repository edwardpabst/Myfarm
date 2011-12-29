class AddColumnsToSupplies < ActiveRecord::Migration
  def self.up
    remove_column :supplies, :distribution_unit
    add_column :supplies, :distribution_uom, :float
    add_column :supplies, :Item_number, :string
  end

  def self.down
    remove_column :crops, :avg_yield_acre
  end
end
