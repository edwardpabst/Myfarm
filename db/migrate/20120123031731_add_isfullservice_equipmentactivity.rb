class AddIsfullserviceEquipmentactivity < ActiveRecord::Migration
  def self.up
    add_column :equipmentactivities, :is_fullservice, :boolean
  end

  def self.down
    remove_column :equipmentactivities, :is_fullservice

  end
end
