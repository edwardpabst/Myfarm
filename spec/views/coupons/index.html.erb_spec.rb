require 'spec_helper'

describe "coupons/index.html.erb" do
  before(:each) do
    assign(:coupons, [
      stub_model(Coupon,
        :coupon_code => "Coupon Code",
        :discount_amount => "9.99",
        :discount_percent => "9.99"
      ),
      stub_model(Coupon,
        :coupon_code => "Coupon Code",
        :discount_amount => "9.99",
        :discount_percent => "9.99"
      )
    ])
  end

  it "renders a list of coupons" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Coupon Code".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
