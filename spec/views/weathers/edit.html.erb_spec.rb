require 'spec_helper'

describe "weathers/edit.html.erb" do
  before(:each) do
    @weather = assign(:weather, stub_model(Weather,
      :new_record? => false,
      :postal_code => "MyString",
      :segment => "MyString",
      :temperature => 1,
      :sky_condition => "MyString",
      :wind_direction => "MyString",
      :wind_speed => 1,
      :gusting_to => 1,
      :relative_humidity => 1
    ))
  end

  it "renders the edit weather form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => weather_path(@weather), :method => "post" do
      assert_select "input#weather_postal_code", :name => "weather[postal_code]"
      assert_select "input#weather_segment", :name => "weather[segment]"
      assert_select "input#weather_temperature", :name => "weather[temperature]"
      assert_select "input#weather_sky_condition", :name => "weather[sky_condition]"
      assert_select "input#weather_wind_direction", :name => "weather[wind_direction]"
      assert_select "input#weather_wind_speed", :name => "weather[wind_speed]"
      assert_select "input#weather_gusting_to", :name => "weather[gusting_to]"
      assert_select "input#weather_relative_humidity", :name => "weather[relative_humidity]"
    end
  end
end
