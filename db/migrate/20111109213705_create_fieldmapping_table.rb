class CreateFieldmappingTable < ActiveRecord::Migration
  def self.up
    drop_table :fieldmappings
    create_table :fieldmappings do |t|
      t.integer :field_id
      t.integer :user_id
      t.integer :shape_id
      t.string :shape_description
      t.string :latitude
      t.string :longitude


      t.timestamps
    end
  end

  def self.down
    drop_table :fieldmappings
  end
end
