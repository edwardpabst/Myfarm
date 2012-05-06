require 'spec_helper'

describe "retailcrops/index.html.erb" do
  before(:each) do
    assign(:retailcrops, [
      stub_model(Retailcrop,
        :cropplan_id => 1,
        :user_id => 1,
        :farm_id => 1,
        :status => "Status",
        :shipday1 => false,
        :shipday2 => false,
        :shipday3 => false,
        :shipday4 => false,
        :shipday5 => false,
        :shipday6 => false,
        :shipday7 => false,
        :pickupday1 => false,
        :pickupday2 => false,
        :pickupday3 => false,
        :pickupday4 => false,
        :pickupday5 => false,
        :pickupday6 => false,
        :pickupday7 => false,
        :sales_uom => "Sales Uom",
        :sales_price => "9.99",
        :sales_notes => "Sales Notes",
        :ship_charge => "9.99"
      ),
      stub_model(Retailcrop,
        :cropplan_id => 1,
        :user_id => 1,
        :farm_id => 1,
        :status => "Status",
        :shipday1 => false,
        :shipday2 => false,
        :shipday3 => false,
        :shipday4 => false,
        :shipday5 => false,
        :shipday6 => false,
        :shipday7 => false,
        :pickupday1 => false,
        :pickupday2 => false,
        :pickupday3 => false,
        :pickupday4 => false,
        :pickupday5 => false,
        :pickupday6 => false,
        :pickupday7 => false,
        :sales_uom => "Sales Uom",
        :sales_price => "9.99",
        :sales_notes => "Sales Notes",
        :ship_charge => "9.99"
      )
    ])
  end

  it "renders a list of retailcrops" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sales Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sales Notes".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
