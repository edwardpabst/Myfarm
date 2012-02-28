class CreateWeatherIndexes < ActiveRecord::Migration
  def self.up
     add_index :weathers, :postalcode
     add_index :weathers, :weather_date
  end

  def self.down
  end
end
