require 'spec_helper'

describe "coupons/show.html.erb" do
  before(:each) do
    @coupon = assign(:coupon, stub_model(Coupon,
      :coupon_code => "Coupon Code",
      :discount_amount => "9.99",
      :discount_percent => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Coupon Code/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
