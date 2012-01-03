class CreateShipments < ActiveRecord::Migration
  def self.up
    create_table :shipments do |t|
      t.integer :user_id
      t.integer :customer_id
      t.datetime :ship_date
      t.integer :contract_id
      t.integer :cropplan_id
      t.integer :inventorylot_id
      t.float :price
      t.string :ship_uom
      t.integer :trucker_id
      t.string :trucker_name
      t.string :manifest_id
      t.float :totalweight
      t.string :weight_uom
      t.string :shipto_street
      t.string :shipto_city
      t.string :shipto_state
      t.string :shipto_postalcode
      t.float :shipping_charge
      t.float :commission_amount

      t.timestamps
    end
  end

  def self.down
    drop_table :shipments
  end
end
