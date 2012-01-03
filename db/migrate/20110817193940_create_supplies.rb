class CreateSupplies < ActiveRecord::Migration
  def self.up
    create_table :supplies do |t|
      t.integer :user_id
      t.string :supplyname
      t.string :supply_type
      t.string :supply_uom
      t.float :supply_cost_uom
      t.string :distribution_unit
      t.float :rate_acre
      t.string :epa_id
      t.string :manufacturer
      t.string :formulation
      t.string :carrier
      t.float :carrier_rate_acre
      t.string :problem_target

      t.timestamps
    end
  end

  def self.down
    drop_table :supplies
  end
end
