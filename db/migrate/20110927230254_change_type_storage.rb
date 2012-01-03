class ChangeTypeStorage < ActiveRecord::Migration
  def self.up
    remove_column :storages, :type
    add_column :storages, :storage_type, :string

  end

  def self.down
    remove_column :storages, :storage_type
  end
end
