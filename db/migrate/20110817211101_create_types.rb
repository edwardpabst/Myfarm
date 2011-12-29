class CreateTypes < ActiveRecord::Migration
  def self.up
    create_table :types do |t|
      t.string :typename
      t.string :type_value_string
      t.integer :type_value_integer
      t.boolean :type_boolean

      t.timestamps
    end
  end

  def self.down
    drop_table :types
  end
end
