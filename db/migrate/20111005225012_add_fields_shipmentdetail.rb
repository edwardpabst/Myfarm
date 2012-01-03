class AddFieldsShipmentdetail < ActiveRecord::Migration
  def self.up
    add_column :shipmentdetails, :ext_amount, :float
    add_column :shipmentdetails, :shipment_id, :integer
 

  end

  def self.down
    remove_column :shipmentdetails, :shipment_id
     remove_column :shipmentdetails, :ext_amount
 
  end
end
