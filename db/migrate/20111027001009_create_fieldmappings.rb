class CreateFieldmappings < ActiveRecord::Migration
  def self.up
    create_table :fieldmappings do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :fieldmappings
  end
end
