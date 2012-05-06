require 'spec_helper'

describe "retailorderdetails/index.html.erb" do
  before(:each) do
    assign(:retailorderdetails, [
      stub_model(Retailorderdetail,
        :user_id => 1,
        :retailcrop_id => 1,
        :cropplan_id => 1,
        :detail_uom => "Detail Uom",
        :detail_price => "9.99",
        :detail_qty => "9.99",
        :detail_ext_amount => "9.99",
        :detail_shipcharge => "9.99",
        :detail_status => "Detail Status"
      ),
      stub_model(Retailorderdetail,
        :user_id => 1,
        :retailcrop_id => 1,
        :cropplan_id => 1,
        :detail_uom => "Detail Uom",
        :detail_price => "9.99",
        :detail_qty => "9.99",
        :detail_ext_amount => "9.99",
        :detail_shipcharge => "9.99",
        :detail_status => "Detail Status"
      )
    ])
  end

  it "renders a list of retailorderdetails" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Detail Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Detail Status".to_s, :count => 2
  end
end
