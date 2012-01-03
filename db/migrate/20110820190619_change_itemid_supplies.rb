class ChangeItemidSupplies < ActiveRecord::Migration
  def self.up
    remove_column :supplies, :Item_number
    add_column :supplies, :item_number, :string
  end

  def self.down
  end
end
