require 'spec_helper'

describe "farms/index.html.erb" do
  before(:each) do
    assign(:farms, [
      stub_model(Farm,
        :farmname => "Farmname",
        :total_acres => 1.5
      ),
      stub_model(Farm,
        :farmname => "Farmname",
        :total_acres => 1.5
      )
    ])
  end

  it "renders a list of farms" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Farmname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
