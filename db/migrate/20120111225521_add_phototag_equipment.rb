class AddPhototagEquipment < ActiveRecord::Migration
  def self.up
    add_column :equipment, :photo, :string
  end

  def self.down
    remove_column :equipment, :photo

  end
end
