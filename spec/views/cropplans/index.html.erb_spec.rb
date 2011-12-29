require 'spec_helper'

describe "cropplans/index.html.erb" do
  before(:each) do
    assign(:cropplans, [
      stub_model(Cropplan,
        :crop_id => 1,
        :plan_year => "Plan Year",
        :plan_status => "Plan Status"
      ),
      stub_model(Cropplan,
        :crop_id => 1,
        :plan_year => "Plan Year",
        :plan_status => "Plan Status"
      )
    ])
  end

  it "renders a list of cropplans" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Plan Year".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Plan Status".to_s, :count => 2
  end
end
