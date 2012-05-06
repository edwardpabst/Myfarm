class CreateRetailorders < ActiveRecord::Migration
  def self.up
    create_table :retailorders do |t|
      t.integer :source_user_id
      t.integer :order_user_id
      t.datetime :order_date
      t.date :need_by_date
      t.string :coupon_code
      t.string :bill_address1
      t.string :bill_address2
      t.string :bill_city
      t.string :bill_state
      t.string :bill_postalcode
      t.string :bill_email
      t.string :bill_phone
      t.string :ship_address1
      t.string :ship_address2
      t.string :ship_city
      t.string :ship_state
      t.string :ship_postalcode
      t.string :order_status
      t.decimal :order_total
      t.string :payment_method
      t.string :payment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :retailorders
  end
end
