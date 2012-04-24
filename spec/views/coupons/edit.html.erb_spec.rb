require 'spec_helper'

describe "coupons/edit.html.erb" do
  before(:each) do
    @coupon = assign(:coupon, stub_model(Coupon,
      :new_record? => false,
      :coupon_code => "MyString",
      :discount_amount => "9.99",
      :discount_percent => "9.99"
    ))
  end

  it "renders the edit coupon form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => coupon_path(@coupon), :method => "post" do
      assert_select "input#coupon_coupon_code", :name => "coupon[coupon_code]"
      assert_select "input#coupon_discount_amount", :name => "coupon[discount_amount]"
      assert_select "input#coupon_discount_percent", :name => "coupon[discount_percent]"
    end
  end
end
