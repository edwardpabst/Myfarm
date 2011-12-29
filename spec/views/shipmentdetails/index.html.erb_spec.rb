require 'spec_helper'

describe "shipmentdetails/index.html.erb" do
  before(:each) do
    assign(:shipmentdetails, [
      stub_model(Shipmentdetail,
        :inventorylot_id => 1,
        :price => 1.5,
        :qty => 1.5,
        :qty_uom => "Qty Uom",
        :detail_status => "Detail Status",
        :cropplan_id => 1,
        :notes => "Notes"
      ),
      stub_model(Shipmentdetail,
        :inventorylot_id => 1,
        :price => 1.5,
        :qty => 1.5,
        :qty_uom => "Qty Uom",
        :detail_status => "Detail Status",
        :cropplan_id => 1,
        :notes => "Notes"
      )
    ])
  end

  it "renders a list of shipmentdetails" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Qty Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Detail Status".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
  end
end
