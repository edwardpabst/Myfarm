class AddCountryidInParty < ActiveRecord::Migration
  def self.up
    add_column  :countries, :country_id, :integer 
    remove_column :countries, :partycountry
  
  end

  def self.down
  end
end
