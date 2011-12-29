class AddOriginalamtShipmentdetail < ActiveRecord::Migration
  def self.up
    add_column :shipmentdetails, :original_inv_amount, :float 
  end

  def self.down
    remove_column :shipmentdetails, :original_inv_amount
  end
end
