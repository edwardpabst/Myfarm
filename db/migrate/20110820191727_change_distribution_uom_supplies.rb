class ChangeDistributionUomSupplies < ActiveRecord::Migration
  def self.up
    remove_column :supplies, :distribution_uom
    add_column :supplies, :distribution_uom, :string
  end

  def self.down
  end
end
