class CreateFarms < ActiveRecord::Migration
  def self.up
    create_table :farms do |t|
      t.string :farmname
      t.float :total_acres

      t.timestamps
    end
  end

  def self.down
    drop_table :farms
  end
end
