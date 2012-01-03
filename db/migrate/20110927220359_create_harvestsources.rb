class CreateHarvestsources < ActiveRecord::Migration
  def self.up
    create_table :harvestsources do |t|
      t.integer :scaleticket_id
      t.integer :field_id
      t.string :from_row
      t.string :to_row

      t.timestamps
    end
  end

  def self.down
    drop_table :harvestsources
  end
end
