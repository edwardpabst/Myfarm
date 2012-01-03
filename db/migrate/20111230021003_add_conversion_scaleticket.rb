class AddConversionScaleticket < ActiveRecord::Migration
  def self.up
      add_column :scaletickets, :weight_conversion, :float
      add_column :scaletickets, :inventory_uom, :string
  
  end

  def self.down
    remove_column :scaletickets, :weight_conversion
    remove_column :scaletickets, :inventory_uom
  end
end
