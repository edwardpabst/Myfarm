require 'spec_helper'

describe "weathers/edit.html.erb" do
  before(:each) do
    @weather = assign(:weather, stub_model(Weather,
      :new_record? => false,
      :postalcode => "MyString",
      :temperature_high => "MyString",
      :temperature_low => "MyString",
      :wind_speed => "MyString",
      :wind_direction_degrees => "MyString",
      :wind_direction_compass => "MyString",
      :precipitation => "MyString",
      :sky_condition => "MyString",
      :weather_condition_1 => "MyString",
      :weather_condition_2 => "MyString",
      :weather_condition_3 => "MyString",
      :weather_condition_4 => "MyString",
      :weather_condition_5 => "MyString",
      :weather_condition_6 => "MyString",
      :weather_condition_7 => "MyString",
      :weather_condition_8 => "MyString"
    ))
  end

  it "renders the edit weather form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => weather_path(@weather), :method => "post" do
      assert_select "input#weather_postalcode", :name => "weather[postalcode]"
      assert_select "input#weather_temperature_high", :name => "weather[temperature_high]"
      assert_select "input#weather_temperature_low", :name => "weather[temperature_low]"
      assert_select "input#weather_wind_speed", :name => "weather[wind_speed]"
      assert_select "input#weather_wind_direction_degrees", :name => "weather[wind_direction_degrees]"
      assert_select "input#weather_wind_direction_compass", :name => "weather[wind_direction_compass]"
      assert_select "input#weather_precipitation", :name => "weather[precipitation]"
      assert_select "input#weather_sky_condition", :name => "weather[sky_condition]"
      assert_select "input#weather_weather_condition_1", :name => "weather[weather_condition_1]"
      assert_select "input#weather_weather_condition_2", :name => "weather[weather_condition_2]"
      assert_select "input#weather_weather_condition_3", :name => "weather[weather_condition_3]"
      assert_select "input#weather_weather_condition_4", :name => "weather[weather_condition_4]"
      assert_select "input#weather_weather_condition_5", :name => "weather[weather_condition_5]"
      assert_select "input#weather_weather_condition_6", :name => "weather[weather_condition_6]"
      assert_select "input#weather_weather_condition_7", :name => "weather[weather_condition_7]"
      assert_select "input#weather_weather_condition_8", :name => "weather[weather_condition_8]"
    end
  end
end
