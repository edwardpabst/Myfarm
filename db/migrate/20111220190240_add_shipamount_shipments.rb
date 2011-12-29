class AddShipamountShipments < ActiveRecord::Migration
  def self.up
      add_column :shipments, :ship_amount, :float
  
  end

  def self.down
    remove_column :shipments, :ship_amount
  end
end
