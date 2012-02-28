class Weather < ActiveRecord::Base
  attr_accessible :weather_date,  :weather_time, :postalcode, :temperature_high, :temperature_low, :wind_speed,
   :wind_direction_degrees, :wind_direction_compass, :precipitation, :sky_condition, :weather_condition_1,
   :weather_condition_2, :weather_condition_3, :weather_condition_4, :weather_condition_5, :weather_condition_6,
   :weather_condition_7, :weather_condition_8
end
