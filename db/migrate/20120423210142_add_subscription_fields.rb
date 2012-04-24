class AddSubscriptionFields < ActiveRecord::Migration
  def self.up
     
     add_column :subscriptions, :expiration_date, :datetime
     add_column :subscriptions, :coupon_code, :string

  end

  def self.down

    remove_column :subscriptions, :expiration_date
    remove_column :subscriptions, :coupon_code
  
  end
end
