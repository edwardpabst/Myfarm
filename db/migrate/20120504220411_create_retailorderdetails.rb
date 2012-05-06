class CreateRetailorderdetails < ActiveRecord::Migration
  def self.up
    create_table :retailorderdetails do |t|
      t.integer :user_id
      t.integer :retailcrop_id
      t.integer :cropplan_id
      t.string :detail_uom
      t.decimal :detail_price
      t.decimal :detail_qty
      t.decimal :detail_ext_amount
      t.decimal :detail_shipcharge
      t.string :detail_status

      t.timestamps
    end
  end

  def self.down
    drop_table :retailorderdetails
  end
end
