class AddIndexesInventoryticket < ActiveRecord::Migration
  def self.up
    # add indexes

    add_index :inventorytickets, :scaleticket_id
    add_index :inventorytickets, :field_id
    add_index :inventorytickets, :inventorylot_id
 
  end

  def self.down
    remove_index :inventorytickets, :scaleticket_id
    remove_index :inventorytickets, :field_id
    remove_index :inventorytickets, :inventorylot_id
 
  end
end
