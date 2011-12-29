class CreateCrops < ActiveRecord::Migration
  def self.up
    create_table :crops do |t|
      t.string :cropname
      t.string :croptype
      t.string :cropspecific

      t.timestamps
    end
  end

  def self.down
    drop_table :crops
  end
end
