class CreateSupplyinventories < ActiveRecord::Migration
  def self.up
    create_table :supplyinventories do |t|
      t.integer :supply_id
      t.string :supply_uom
      t.integer :user_id
      t.integer :storage_id
      t.float :qty_in
      t.float :qty_onhand
      t.float :qty_out
      t.float :onhand_value
      t.float :avg_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :supplyinventories
  end
end
