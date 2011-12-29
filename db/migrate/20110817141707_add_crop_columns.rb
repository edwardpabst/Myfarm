class AddCropColumns < ActiveRecord::Migration
  def self.up

    add_column :crops, :crop_inventory_uom, :string
   
 
 
  end

  def self.down
  

    remove_column :crops, :crop_inventory_uom, :string
 
  end
end
