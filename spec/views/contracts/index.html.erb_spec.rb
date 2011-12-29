require 'spec_helper'

describe "contracts/index.html.erb" do
  before(:each) do
    assign(:contracts, [
      stub_model(Contract,
        :party_id => 1,
        :cropplan_id => 1,
        :contract_uom => "Contract Uom",
        :contract_price => 1.5,
        :notes => "Notes",
        :min_qty => 1.5,
        :max_qty => 1.5,
        :payment_type => "Payment Type",
        :payment_terms => "Payment Terms"
      ),
      stub_model(Contract,
        :party_id => 1,
        :cropplan_id => 1,
        :contract_uom => "Contract Uom",
        :contract_price => 1.5,
        :notes => "Notes",
        :min_qty => 1.5,
        :max_qty => 1.5,
        :payment_type => "Payment Type",
        :payment_terms => "Payment Terms"
      )
    ])
  end

  it "renders a list of contracts" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contract Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Terms".to_s, :count => 2
  end
end
