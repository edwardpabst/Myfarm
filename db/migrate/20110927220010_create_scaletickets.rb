class CreateScaletickets < ActiveRecord::Migration
  def self.up
    create_table :scaletickets do |t|
      t.integer :cropplan_id
      t.float :pack_qty
      t.string :weight_uom
      t.float :gross_weight
      t.float :tare_weight
      t.float :net_weight
      t.float :moisture_pct
      t.integer :party_id
      t.datetime :tran_date

      t.timestamps
    end
  end

  def self.down
    drop_table :scaletickets
  end
end
