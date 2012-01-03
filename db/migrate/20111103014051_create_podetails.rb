class CreatePodetails < ActiveRecord::Migration
  def self.up
    create_table :podetails do |t|
      t.integer :po_id
      t.integer :user_id
      t.integer :supply_id
      t.integer :storage_id
      t.float :qty_ordered
      t.integer :supply_uom
      t.float :order_price
      t.float :ext_amount
      t.string :detail_status
      t.float :qty_received
      t.float :receipt_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :podetails
  end
end
