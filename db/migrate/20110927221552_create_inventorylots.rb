class CreateInventorylots < ActiveRecord::Migration
  def self.up
    create_table :inventorylots do |t|
      t.integer :scaleticket_id
      t.integer :cropplan_id
      t.string :inventory_uom
      t.float :qty
      t.string :grade
      t.string :lab_report
      t.integer :storage_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inventorylots
  end
end
