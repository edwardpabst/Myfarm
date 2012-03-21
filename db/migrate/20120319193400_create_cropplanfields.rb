class CreateCropplanfields < ActiveRecord::Migration
  def self.up
    create_table :cropplanfields do |t|
      t.integer :cropplan_id
      t.integer :field_id
      t.decimal :plan_acres
      t.integer :avg_yield
      t.string :yield_uom

      t.timestamps
    end
    
    remove_column :cropplanfields, :plan_acres
    add_column :cropplanfields, :plan_acres, :decimal, { :scale => 2, :precision => 9 }
  end

  def self.down
    drop_table :cropplanfields
  end
end
