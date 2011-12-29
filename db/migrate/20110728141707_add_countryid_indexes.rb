class AddCountryidIndexes < ActiveRecord::Migration
  def self.up
    add_column :parties, :country_id, :integer
    add_index :parties, :country_id
 
  end

  def self.down
    remove_index :parties, :country_id
    remove_column :parties, :country_id
 
  end
end
