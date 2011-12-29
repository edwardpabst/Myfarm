class AddCropIndexes < ActiveRecord::Migration
  def self.up
    add_column :crops, :user_id, :integer
    add_column :crops, :crop_uom, :string
    add_column :crops, :price_per_uom, :floating
    add_index :crops, :user_id
 
  end

  def self.down
    remove_index :crops, :user_id
    remove_column :crops, :user_id
    remove_column :crops, :crop_uom, :string
    remove_column :crops, :price_per_uom, :floating
  end
end
