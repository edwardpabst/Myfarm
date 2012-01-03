class AddTframtInventorylot < ActiveRecord::Migration
  def self.up
    remove_column :inventorylots, :qty_out 
    add_column :inventorylots, :transfer_amount, :float 
    add_column :inventorylots, :qty_out_transfer, :float
    add_column :inventorylots, :qty_out_ship, :float
  end

  def self.down
    remove_column :inventorylots, :transfer_amount
    remove_column :inventorylots, :qty_out_transfer
    remove_column :inventorylots, :qty_out_ship
  end
end
