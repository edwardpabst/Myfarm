require 'spec_helper'

describe "retailorders/index.html.erb" do
  before(:each) do
    assign(:retailorders, [
      stub_model(Retailorder,
        :source_user_id => 1,
        :order_user_id => 1,
        :coupon_code => "Coupon Code",
        :bill_address1 => "Bill Address1",
        :bill_address2 => "Bill Address2",
        :bill_city => "Bill City",
        :bill_state => "Bill State",
        :bill_postalcode => "Bill Postalcode",
        :bill_email => "Bill Email",
        :bill_phone => "Bill Phone",
        :ship_address1 => "Ship Address1",
        :ship_address2 => "Ship Address2",
        :ship_city => "Ship City",
        :ship_state => "Ship State",
        :ship_postalcode => "Ship Postalcode",
        :order_status => "Order Status",
        :order_total => "9.99",
        :payment_method => "Payment Method",
        :payment_id => "Payment"
      ),
      stub_model(Retailorder,
        :source_user_id => 1,
        :order_user_id => 1,
        :coupon_code => "Coupon Code",
        :bill_address1 => "Bill Address1",
        :bill_address2 => "Bill Address2",
        :bill_city => "Bill City",
        :bill_state => "Bill State",
        :bill_postalcode => "Bill Postalcode",
        :bill_email => "Bill Email",
        :bill_phone => "Bill Phone",
        :ship_address1 => "Ship Address1",
        :ship_address2 => "Ship Address2",
        :ship_city => "Ship City",
        :ship_state => "Ship State",
        :ship_postalcode => "Ship Postalcode",
        :order_status => "Order Status",
        :order_total => "9.99",
        :payment_method => "Payment Method",
        :payment_id => "Payment"
      )
    ])
  end

  it "renders a list of retailorders" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Coupon Code".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bill Address1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bill Address2".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bill City".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bill State".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bill Postalcode".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bill Email".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bill Phone".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ship Address1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ship Address2".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ship City".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ship State".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ship Postalcode".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Order Status".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Method".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment".to_s, :count => 2
  end
end
