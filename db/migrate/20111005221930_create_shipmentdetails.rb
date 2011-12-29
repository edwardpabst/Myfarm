class CreateShipmentdetails < ActiveRecord::Migration
  def self.up
    create_table :shipmentdetails do |t|
      t.integer :inventorylot_id
      t.float :price
      t.float :qty
      t.string :qty_uom
      t.string :detail_status
      t.integer :cropplan_id
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :shipmentdetails
  end
end
