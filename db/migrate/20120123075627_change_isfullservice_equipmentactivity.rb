class ChangeIsfullserviceEquipmentactivity < ActiveRecord::Migration
  def self.up
    remove_column :equipmentactivities, :is_fullservice
    add_column :equipmentactivities, :activity_type, :string
  end

  def self.down
    remove_column :equipmentactivities, :activity_type

  end
end
