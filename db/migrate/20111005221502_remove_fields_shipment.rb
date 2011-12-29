class RemoveFieldsShipment < ActiveRecord::Migration
  def self.up
   remove_column :shipments, :inventorylot_id
   remove_column :shipments, :price
   remove_column :shipments, :ship_uom 
   remove_column :shipments, :totalweight 
   remove_column :shipments, :weight_uom 

   add_column :shipments, :broker_id, :integer

  end

  def self.down

  end
end
