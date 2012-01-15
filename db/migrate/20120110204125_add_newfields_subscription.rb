class AddNewfieldsSubscription < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :address_line_1, :string
    add_column :subscriptions, :address_zip, :string
  end

  def self.down
    remove_column :subscriptions, :address_line_1 
    remove_column :subscriptions, :address_zip
  end
end
