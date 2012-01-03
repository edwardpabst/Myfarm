class CreatePartytypes < ActiveRecord::Migration
  def self.up
    create_table :partytypes do |t|
      t.string :typedescription
      t.string :typecode

      t.timestamps
    end
  end

  def self.down
    drop_table :partytypes
  end
end
