class CreateWeathers < ActiveRecord::Migration
  def self.up
    create_table :weathers do |t|
      t.date :weather_date
      t.string :postal_code
      t.string :segment
      t.integer :temperature
      t.string :sky_condition
      t.string :wind_direction
      t.integer :wind_speed
      t.integer :gusting_to
      t.integer :relative_humidity

      t.timestamps
    end
  end

  def self.down
    drop_table :weathers
  end
end
