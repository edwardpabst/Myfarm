class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :coupon_code
      t.decimal :discount_amount
      t.datetime :begin_date
      t.datetime :end_date
      t.decimal :discount_percent

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
