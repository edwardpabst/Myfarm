class Event < ActiveRecord::Base
  
  # To specify the columns to use call it like this:
  # 
  # has_event_calendar :start_at_field  => 'custom_start_at', :end_at_field => 'custom_end_at'
  #
  has_event_calendar
end
