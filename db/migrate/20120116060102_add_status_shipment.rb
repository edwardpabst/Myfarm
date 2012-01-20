class AddStatusShipment < ActiveRecord::Migration
  def self.up
    add_column :shipments, :ship_status, :string
  end

  def self.down
    remove_column :shipments, :ship_status

  end
end
