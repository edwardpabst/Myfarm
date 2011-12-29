require 'spec_helper'

describe "weathers/show.html.erb" do
  before(:each) do
    @weather = assign(:weather, stub_model(Weather,
      :postal_code => "Postal Code",
      :segment => "Segment",
      :temperature => 1,
      :sky_condition => "Sky Condition",
      :wind_direction => "Wind Direction",
      :wind_speed => 1,
      :gusting_to => 1,
      :relative_humidity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Postal Code/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Segment/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Sky Condition/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Wind Direction/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
