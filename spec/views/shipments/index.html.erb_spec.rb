require 'spec_helper'

describe "shipments/index.html.erb" do
  before(:each) do
    assign(:shipments, [
      stub_model(Shipment,
        :user_id => 1,
        :customer_id => 1,
        :contract_id => 1,
        :cropplan_id => 1,
        :inventorylot_id => 1,
        :price => 1.5,
        :ship_uom => "Ship Uom",
        :trucker_id => 1,
        :trucker_name => "Trucker Name",
        :manifest_id => "Manifest",
        :totalweight => 1.5,
        :weight_uom => "Weight Uom",
        :shipto_street => "Shipto Street",
        :shipto_city => "Shipto City",
        :shipto_state => "Shipto State",
        :shipto_postalcode => "Shipto Postalcode",
        :shipping_charge => 1.5,
        :commission_amount => 1.5
      ),
      stub_model(Shipment,
        :user_id => 1,
        :customer_id => 1,
        :contract_id => 1,
        :cropplan_id => 1,
        :inventorylot_id => 1,
        :price => 1.5,
        :ship_uom => "Ship Uom",
        :trucker_id => 1,
        :trucker_name => "Trucker Name",
        :manifest_id => "Manifest",
        :totalweight => 1.5,
        :weight_uom => "Weight Uom",
        :shipto_street => "Shipto Street",
        :shipto_city => "Shipto City",
        :shipto_state => "Shipto State",
        :shipto_postalcode => "Shipto Postalcode",
        :shipping_charge => 1.5,
        :commission_amount => 1.5
      )
    ])
  end

  it "renders a list of shipments" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ship Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Trucker Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Manifest".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weight Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shipto Street".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shipto City".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shipto State".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shipto Postalcode".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
