require 'spec_helper'

describe "podetails/index.html.erb" do
  before(:each) do
    assign(:podetails, [
      stub_model(Podetail,
        :po_id => 1,
        :user_id => 1,
        :supply_id => 1,
        :storage_id => 1,
        :qty_ordered => 1.5,
        :supply_uom => 1,
        :order_price => 1.5,
        :ext_amount => 1.5,
        :detail_status => "Detail Status",
        :qty_received => 1.5,
        :receipt_amount => 1.5
      ),
      stub_model(Podetail,
        :po_id => 1,
        :user_id => 1,
        :supply_id => 1,
        :storage_id => 1,
        :qty_ordered => 1.5,
        :supply_uom => 1,
        :order_price => 1.5,
        :ext_amount => 1.5,
        :detail_status => "Detail Status",
        :qty_received => 1.5,
        :receipt_amount => 1.5
      )
    ])
  end

  it "renders a list of podetails" do
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
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Detail Status".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
