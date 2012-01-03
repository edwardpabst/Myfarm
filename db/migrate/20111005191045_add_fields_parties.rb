class AddFieldsParties < ActiveRecord::Migration
  def self.up
    add_column :parties, :charge_hour, :float
    add_column :parties, :ship_address1, :string
    add_column :parties, :ship_address2, :string
    add_column :parties, :ship_city, :string
    add_column :parties, :ship_state, :string
    add_column :parties, :ship_postalcode, :string
    add_column :parties, :ship_phone, :string

  end

  def self.down
    remove_column :parties, :charge_hour
     remove_column :parties, :ship_address1 
     remove_column :parties, :ship_address2 
     remove_column :parties, :ship_city 
     remove_column :parties, :ship_state 
     remove_column :parties, :ship_postalcode 
     remove_column :parties, :ship_phone 
  end
end
