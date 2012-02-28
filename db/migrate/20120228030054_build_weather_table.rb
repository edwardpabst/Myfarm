class BuildWeatherTable < ActiveRecord::Migration
  def self.up
    drop_table :weathers
    create_table :weathers do |t|
      t.date :weather_date
      t.datetime :weather_time
      t.string :postalcode
      t.string :temperature_high
      t.string :temperature_low
      t.string :wind_speed
      t.string :wind_direction_degrees
      t.string :wind_direction_compass
      t.string :precipitation
      t.string :sky_condition
      t.string :weather_condition_1
      t.string :weather_condition_2
      t.string :weather_condition_3
      t.string :weather_condition_4
      t.string :weather_condition_5
      t.string :weather_condition_6
      t.string :weather_condition_7
      t.string :weather_condition_8

      t.timestamps
    end
    
    add_index :weathers, :postalcode
    add_index :weathers, :weather_date
  end

  def self.down
    drop_table :weathers
  end
end
