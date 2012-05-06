require 'spec_helper'

describe "retailcrops/edit.html.erb" do
  before(:each) do
    @retailcrop = assign(:retailcrop, stub_model(Retailcrop,
      :new_record? => false,
      :cropplan_id => 1,
      :user_id => 1,
      :farm_id => 1,
      :status => "MyString",
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
      :sales_uom => "MyString",
      :sales_price => "9.99",
      :sales_notes => "MyString",
      :ship_charge => "9.99"
    ))
  end

  it "renders the edit retailcrop form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => retailcrop_path(@retailcrop), :method => "post" do
      assert_select "input#retailcrop_cropplan_id", :name => "retailcrop[cropplan_id]"
      assert_select "input#retailcrop_user_id", :name => "retailcrop[user_id]"
      assert_select "input#retailcrop_farm_id", :name => "retailcrop[farm_id]"
      assert_select "input#retailcrop_status", :name => "retailcrop[status]"
      assert_select "input#retailcrop_shipday1", :name => "retailcrop[shipday1]"
      assert_select "input#retailcrop_shipday2", :name => "retailcrop[shipday2]"
      assert_select "input#retailcrop_shipday3", :name => "retailcrop[shipday3]"
      assert_select "input#retailcrop_shipday4", :name => "retailcrop[shipday4]"
      assert_select "input#retailcrop_shipday5", :name => "retailcrop[shipday5]"
      assert_select "input#retailcrop_shipday6", :name => "retailcrop[shipday6]"
      assert_select "input#retailcrop_shipday7", :name => "retailcrop[shipday7]"
      assert_select "input#retailcrop_pickupday1", :name => "retailcrop[pickupday1]"
      assert_select "input#retailcrop_pickupday2", :name => "retailcrop[pickupday2]"
      assert_select "input#retailcrop_pickupday3", :name => "retailcrop[pickupday3]"
      assert_select "input#retailcrop_pickupday4", :name => "retailcrop[pickupday4]"
      assert_select "input#retailcrop_pickupday5", :name => "retailcrop[pickupday5]"
      assert_select "input#retailcrop_pickupday6", :name => "retailcrop[pickupday6]"
      assert_select "input#retailcrop_pickupday7", :name => "retailcrop[pickupday7]"
      assert_select "input#retailcrop_sales_uom", :name => "retailcrop[sales_uom]"
      assert_select "input#retailcrop_sales_price", :name => "retailcrop[sales_price]"
      assert_select "input#retailcrop_sales_notes", :name => "retailcrop[sales_notes]"
      assert_select "input#retailcrop_ship_charge", :name => "retailcrop[ship_charge]"
    end
  end
end
