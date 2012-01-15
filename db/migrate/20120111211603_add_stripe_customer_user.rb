class AddStripeCustomerUser < ActiveRecord::Migration
  def self.up
    add_column :users, :stripe_customer_id, :string
   
  end

  def self.down
    remove_column :users, :stripe_customer_id
    
  end
end
