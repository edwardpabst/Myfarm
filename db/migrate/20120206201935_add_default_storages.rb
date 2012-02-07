class AddDefaultStorages < ActiveRecord::Migration
  def self.up
    add_column :storages, :is_supply_default, :boolean
  end

  def self.down
    remove_column :storages, :is_supply_default

  end
end
