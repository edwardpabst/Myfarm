class CreateStorages < ActiveRecord::Migration
  def self.up
    create_table :storages do |t|
      t.string :name
      t.string :type
      t.float :size
      t.string :size_uom
      t.string :location
      t.float :capacity
      t.string :capacity_uom

      t.timestamps
    end
  end

  def self.down
    drop_table :storages
  end
end
