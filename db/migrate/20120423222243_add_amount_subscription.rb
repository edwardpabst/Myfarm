class AddAmountSubscription < ActiveRecord::Migration
  def self.up
     
     add_column :subscriptions, :subscription_amount, :decimal
     

  end

  def self.down

    remove_column :subscriptions, :subscription_amount
    
  
  end
end
