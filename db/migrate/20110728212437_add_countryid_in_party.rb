class AddCountryidInParty < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :code2
      t.string :name
      t.string :nameLC
      t.string :code3
      t.string :number
      t.string :country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
