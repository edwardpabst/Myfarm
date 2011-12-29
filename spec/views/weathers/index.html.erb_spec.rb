require 'spec_helper'

describe "weathers/index.html.erb" do
  before(:each) do
    assign(:weathers, [
      stub_model(Weather,
        :postal_code => "Postal Code",
        :segment => "Segment",
        :temperature => 1,
        :sky_condition => "Sky Condition",
        :wind_direction => "Wind Direction",
        :wind_speed => 1,
        :gusting_to => 1,
        :relative_humidity => 1
      ),
      stub_model(Weather,
        :postal_code => "Postal Code",
        :segment => "Segment",
        :temperature => 1,
        :sky_condition => "Sky Condition",
        :wind_direction => "Wind Direction",
        :wind_speed => 1,
        :gusting_to => 1,
        :relative_humidity => 1
      )
    ])
  end

  it "renders a list of weathers" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Segment".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sky Condition".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Wind Direction".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
