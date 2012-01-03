require 'spec_helper'

describe "shipments/edit.html.erb" do
  before(:each) do
    @shipment = assign(:shipment, stub_model(Shipment,
      :new_record? => false,
      :user_id => 1,
      :customer_id => 1,
      :contract_id => 1,
      :cropplan_id => 1,
      :inventorylot_id => 1,
      :price => 1.5,
      :ship_uom => "MyString",
      :trucker_id => 1,
      :trucker_name => "MyString",
      :manifest_id => "MyString",
      :totalweight => 1.5,
      :weight_uom => "MyString",
      :shipto_street => "MyString",
      :shipto_city => "MyString",
      :shipto_state => "MyString",
      :shipto_postalcode => "MyString",
      :shipping_charge => 1.5,
      :commission_amount => 1.5
    ))
  end

  it "renders the edit shipment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => shipment_path(@shipment), :method => "post" do
      assert_select "input#shipment_user_id", :name => "shipment[user_id]"
      assert_select "input#shipment_customer_id", :name => "shipment[customer_id]"
      assert_select "input#shipment_contract_id", :name => "shipment[contract_id]"
      assert_select "input#shipment_cropplan_id", :name => "shipment[cropplan_id]"
      assert_select "input#shipment_inventorylot_id", :name => "shipment[inventorylot_id]"
      assert_select "input#shipment_price", :name => "shipment[price]"
      assert_select "input#shipment_ship_uom", :name => "shipment[ship_uom]"
      assert_select "input#shipment_trucker_id", :name => "shipment[trucker_id]"
      assert_select "input#shipment_trucker_name", :name => "shipment[trucker_name]"
      assert_select "input#shipment_manifest_id", :name => "shipment[manifest_id]"
      assert_select "input#shipment_totalweight", :name => "shipment[totalweight]"
      assert_select "input#shipment_weight_uom", :name => "shipment[weight_uom]"
      assert_select "input#shipment_shipto_street", :name => "shipment[shipto_street]"
      assert_select "input#shipment_shipto_city", :name => "shipment[shipto_city]"
      assert_select "input#shipment_shipto_state", :name => "shipment[shipto_state]"
      assert_select "input#shipment_shipto_postalcode", :name => "shipment[shipto_postalcode]"
      assert_select "input#shipment_shipping_charge", :name => "shipment[shipping_charge]"
      assert_select "input#shipment_commission_amount", :name => "shipment[commission_amount]"
    end
  end
end
