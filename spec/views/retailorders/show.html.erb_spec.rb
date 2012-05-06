require 'spec_helper'

describe "retailorders/show.html.erb" do
  before(:each) do
    @retailorder = assign(:retailorder, stub_model(Retailorder,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Coupon Code/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Bill Address1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Bill Address2/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Bill City/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Bill State/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Bill Postalcode/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Bill Email/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Bill Phone/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ship Address1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ship Address2/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ship City/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ship State/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Ship Postalcode/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Order Status/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payment Method/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Payment/)
  end
end
