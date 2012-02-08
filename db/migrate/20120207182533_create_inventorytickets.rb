class CreateInventorytickets < ActiveRecord::Migration
  def self.up
    create_table :inventorytickets do |t|
      t.integer :scaleticket_id
      t.integer :field_id
      t.integer :pack_qty
      t.string :inventory_uom
      t.integer :inventorylot_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inventorytickets
  end
end
