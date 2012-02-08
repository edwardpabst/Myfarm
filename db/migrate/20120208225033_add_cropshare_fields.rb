class AddCropshareFields < ActiveRecord::Migration
  def self.up
    add_column :fields, :percent_harvest_acre, :decimal, { :scale => 2, :precision => 9 }
    add_column :fields, :fixed_amount_acre, :decimal, { :scale => 2, :precision => 9 }
    add_column :fields, :fixed_uom, :string
  end

  def self.down
    remove_column  :fields, :percent_harvest_acre
    remove_column  :fields, :fixed_amount_acre
    remove_column  :fields, :fixed_uom
  end
end
