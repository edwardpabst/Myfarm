class CreateCropplans < ActiveRecord::Migration
  def self.up
    create_table :cropplans do |t|
      t.integer :crop_id
      t.string :plan_year
      t.string :plan_status

      t.timestamps
    end
  end

  def self.down
    drop_table :cropplans
  end
end
