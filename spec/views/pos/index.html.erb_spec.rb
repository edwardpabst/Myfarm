require 'spec_helper'

describe "pos/index.html.erb" do
  before(:each) do
    assign(:pos, [
      stub_model(Po,
        :ponumber => "Ponumber",
        :user_id => 1,
        :po_status => "Po Status",
        :payment_type => "Payment Type",
        :payment_number => "Payment Number",
        :supplier_id => 1,
        :notes => "Notes",
        :po_type => "Po Type",
        :order_amount => 1.5
      ),
      stub_model(Po,
        :ponumber => "Ponumber",
        :user_id => 1,
        :po_status => "Po Status",
        :payment_type => "Payment Type",
        :payment_number => "Payment Number",
        :supplier_id => 1,
        :notes => "Notes",
        :po_type => "Po Type",
        :order_amount => 1.5
      )
    ])
  end

  it "renders a list of pos" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ponumber".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Po Status".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Number".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Po Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
