class AddGeocodeFields < ActiveRecord::Migration
  def self.up
    add_column :fields, :latitude, :float  
    add_column :fields, :longitude, :float  
    add_column :fields, :gmaps, :boolean  
  end

  def self.down
  end
end
