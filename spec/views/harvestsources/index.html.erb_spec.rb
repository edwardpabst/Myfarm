require 'spec_helper'

describe "harvestsources/index.html.erb" do
  before(:each) do
    assign(:harvestsources, [
      stub_model(Harvestsource,
        :scaleticket_id => 1,
        :field_id => 1,
        :from_row => "From Row",
        :to_row => "To Row"
      ),
      stub_model(Harvestsource,
        :scaleticket_id => 1,
        :field_id => 1,
        :from_row => "From Row",
        :to_row => "To Row"
      )
    ])
  end

  it "renders a list of harvestsources" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "From Row".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "To Row".to_s, :count => 2
  end
end
