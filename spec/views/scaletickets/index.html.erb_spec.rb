require 'spec_helper'

describe "scaletickets/index.html.erb" do
  before(:each) do
    assign(:scaletickets, [
      stub_model(Scaleticket,
        :cropplan_id => 1,
        :pack_qty => 1.5,
        :weight_uom => "Weight Uom",
        :gross_weight => 1.5,
        :tare_weight => 1.5,
        :net_weight => 1.5,
        :moisture_pct => 1.5,
        :party_id => 1
      ),
      stub_model(Scaleticket,
        :cropplan_id => 1,
        :pack_qty => 1.5,
        :weight_uom => "Weight Uom",
        :gross_weight => 1.5,
        :tare_weight => 1.5,
        :net_weight => 1.5,
        :moisture_pct => 1.5,
        :party_id => 1
      )
    ])
  end

  it "renders a list of scaletickets" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weight Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
