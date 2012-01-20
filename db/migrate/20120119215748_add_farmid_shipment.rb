class AddFarmidShipment < ActiveRecord::Migration
  def self.up
    add_column :shipments, :farm_id, :integer
  end

  def self.down
    remove_column :shipments, :farm_id

  end
end
