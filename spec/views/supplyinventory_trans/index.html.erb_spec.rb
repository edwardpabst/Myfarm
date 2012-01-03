require 'spec_helper'

describe "supplyinventory_trans/index.html.erb" do
  before(:each) do
    assign(:supplyinventory_trans, [
      stub_model(SupplyinventoryTran,
        :supplyinventory_id => 1,
        :supply_tran_type => "Supply Tran Type",
        :supply_tran_type_id => 1,
        :supply_tran_qty => 1.5,
        :supply_tran_cost => 1.5
      ),
      stub_model(SupplyinventoryTran,
        :supplyinventory_id => 1,
        :supply_tran_type => "Supply Tran Type",
        :supply_tran_type_id => 1,
        :supply_tran_qty => 1.5,
        :supply_tran_cost => 1.5
      )
    ])
  end

  it "renders a list of supplyinventory_trans" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Supply Tran Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
