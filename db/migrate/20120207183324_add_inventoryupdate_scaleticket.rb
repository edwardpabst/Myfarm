class AddInventoryupdateScaleticket < ActiveRecord::Migration
  def self.up
    add_column :scaletickets, :inventory_update, :string
  end

  def self.down
    remove_column :scaletickets, :inventory_update

  end
end
