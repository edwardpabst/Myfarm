require 'spec_helper'

describe "supplyinventories/index.html.erb" do
  before(:each) do
    assign(:supplyinventories, [
      stub_model(Supplyinventory,
        :supply_id => 1,
        :supply_uom => "Supply Uom",
        :user_id => 1,
        :storage_id => 1,
        :qty_in => 1.5,
        :qty_onhand => 1.5,
        :qty_out => 1.5,
        :onhand_value => 1.5,
        :avg_cost => 1.5
      ),
      stub_model(Supplyinventory,
        :supply_id => 1,
        :supply_uom => "Supply Uom",
        :user_id => 1,
        :storage_id => 1,
        :qty_in => 1.5,
        :qty_onhand => 1.5,
        :qty_out => 1.5,
        :onhand_value => 1.5,
        :avg_cost => 1.5
      )
    ])
  end

  it "renders a list of supplyinventories" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Supply Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
