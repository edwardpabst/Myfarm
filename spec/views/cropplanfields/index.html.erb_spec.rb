require 'spec_helper'

describe "cropplanfields/index.html.erb" do
  before(:each) do
    assign(:cropplanfields, [
      stub_model(Cropplanfield,
        :cropplan_id => 1,
        :field_id => 1,
        :plan_acres => "9.99",
        :avg_yield => 1,
        :yield_uom => "Yield Uom"
      ),
      stub_model(Cropplanfield,
        :cropplan_id => 1,
        :field_id => 1,
        :plan_acres => "9.99",
        :avg_yield => 1,
        :yield_uom => "Yield Uom"
      )
    ])
  end

  it "renders a list of cropplanfields" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Yield Uom".to_s, :count => 2
  end
end
