require 'spec_helper'

describe "retailorders/edit.html.erb" do
  before(:each) do
    @retailorder = assign(:retailorder, stub_model(Retailorder,
      :new_record? => false,
      :source_user_id => 1,
      :order_user_id => 1,
      :coupon_code => "MyString",
      :bill_address1 => "MyString",
      :bill_address2 => "MyString",
      :bill_city => "MyString",
      :bill_state => "MyString",
      :bill_postalcode => "MyString",
      :bill_email => "MyString",
      :bill_phone => "MyString",
      :ship_address1 => "MyString",
      :ship_address2 => "MyString",
      :ship_city => "MyString",
      :ship_state => "MyString",
      :ship_postalcode => "MyString",
      :order_status => "MyString",
      :order_total => "9.99",
      :payment_method => "MyString",
      :payment_id => "MyString"
    ))
  end

  it "renders the edit retailorder form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => retailorder_path(@retailorder), :method => "post" do
      assert_select "input#retailorder_source_user_id", :name => "retailorder[source_user_id]"
      assert_select "input#retailorder_order_user_id", :name => "retailorder[order_user_id]"
      assert_select "input#retailorder_coupon_code", :name => "retailorder[coupon_code]"
      assert_select "input#retailorder_bill_address1", :name => "retailorder[bill_address1]"
      assert_select "input#retailorder_bill_address2", :name => "retailorder[bill_address2]"
      assert_select "input#retailorder_bill_city", :name => "retailorder[bill_city]"
      assert_select "input#retailorder_bill_state", :name => "retailorder[bill_state]"
      assert_select "input#retailorder_bill_postalcode", :name => "retailorder[bill_postalcode]"
      assert_select "input#retailorder_bill_email", :name => "retailorder[bill_email]"
      assert_select "input#retailorder_bill_phone", :name => "retailorder[bill_phone]"
      assert_select "input#retailorder_ship_address1", :name => "retailorder[ship_address1]"
      assert_select "input#retailorder_ship_address2", :name => "retailorder[ship_address2]"
      assert_select "input#retailorder_ship_city", :name => "retailorder[ship_city]"
      assert_select "input#retailorder_ship_state", :name => "retailorder[ship_state]"
      assert_select "input#retailorder_ship_postalcode", :name => "retailorder[ship_postalcode]"
      assert_select "input#retailorder_order_status", :name => "retailorder[order_status]"
      assert_select "input#retailorder_order_total", :name => "retailorder[order_total]"
      assert_select "input#retailorder_payment_method", :name => "retailorder[payment_method]"
      assert_select "input#retailorder_payment_id", :name => "retailorder[payment_id]"
    end
  end
end
