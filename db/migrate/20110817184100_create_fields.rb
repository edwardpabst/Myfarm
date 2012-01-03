class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.integer :user_id
      t.string :farmname
      t.integer :client_id
      t.string :location
      t.string :country
      t.float :number_acres
      t.string :holding_status
      t.integer :owner_id
      t.float :area_mapped
      t.float :area_legal
      t.float :area_tillable
      t.string :current_state

      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
