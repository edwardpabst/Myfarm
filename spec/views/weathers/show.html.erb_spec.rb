require 'spec_helper'

describe "weathers/show.html.erb" do
  before(:each) do
    @weather = assign(:weather, stub_model(Weather,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Postalcode/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Temperature High/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Temperature Low/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Wind Speed/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Wind Direction Degrees/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Wind Direction Compass/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Precipitation/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Sky Condition/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 2/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 3/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 4/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 6/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 7/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Weather Condition 8/)
  end
end
