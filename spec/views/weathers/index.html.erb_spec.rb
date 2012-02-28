require 'spec_helper'

describe "weathers/index.html.erb" do
  before(:each) do
    assign(:weathers, [
      stub_model(Weather,
        :postalcode => "Postalcode",
        :temperature_high => "Temperature High",
        :temperature_low => "Temperature Low",
        :wind_speed => "Wind Speed",
        :wind_direction_degrees => "Wind Direction Degrees",
        :wind_direction_compass => "Wind Direction Compass",
        :precipitation => "Precipitation",
        :sky_condition => "Sky Condition",
        :weather_condition_1 => "Weather Condition 1",
        :weather_condition_2 => "Weather Condition 2",
        :weather_condition_3 => "Weather Condition 3",
        :weather_condition_4 => "Weather Condition 4",
        :weather_condition_5 => "Weather Condition 5",
        :weather_condition_6 => "Weather Condition 6",
        :weather_condition_7 => "Weather Condition 7",
        :weather_condition_8 => "Weather Condition 8"
      ),
      stub_model(Weather,
        :postalcode => "Postalcode",
        :temperature_high => "Temperature High",
        :temperature_low => "Temperature Low",
        :wind_speed => "Wind Speed",
        :wind_direction_degrees => "Wind Direction Degrees",
        :wind_direction_compass => "Wind Direction Compass",
        :precipitation => "Precipitation",
        :sky_condition => "Sky Condition",
        :weather_condition_1 => "Weather Condition 1",
        :weather_condition_2 => "Weather Condition 2",
        :weather_condition_3 => "Weather Condition 3",
        :weather_condition_4 => "Weather Condition 4",
        :weather_condition_5 => "Weather Condition 5",
        :weather_condition_6 => "Weather Condition 6",
        :weather_condition_7 => "Weather Condition 7",
        :weather_condition_8 => "Weather Condition 8"
      )
    ])
  end

  it "renders a list of weathers" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postalcode".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Temperature High".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Temperature Low".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Wind Speed".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Wind Direction Degrees".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Wind Direction Compass".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Precipitation".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sky Condition".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 2".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 3".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 4".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 5".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 6".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 7".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Condition 8".to_s, :count => 2
  end
end
