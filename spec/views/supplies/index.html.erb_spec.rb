require 'spec_helper'

describe "supplies/index.html.erb" do
  before(:each) do
    assign(:supplies, [
      stub_model(Supply,
        :user_id => 1,
        :supplyname => "Supplyname",
        :supply_type => "Supply Type",
        :supply_uom => "Supply Uom",
        :supply_cost_uom => 1.5,
        :distribution_unit => "Distribution Unit",
        :rate_acre => 1.5,
        :epa_id => "Epa",
        :manufacturer => "Manufacturer",
        :formulation => "Formulation",
        :carrier => "Carrier",
        :carrier_rate_acre => 1.5,
        :problem_target => "Problem Target"
      ),
      stub_model(Supply,
        :user_id => 1,
        :supplyname => "Supplyname",
        :supply_type => "Supply Type",
        :supply_uom => "Supply Uom",
        :supply_cost_uom => 1.5,
        :distribution_unit => "Distribution Unit",
        :rate_acre => 1.5,
        :epa_id => "Epa",
        :manufacturer => "Manufacturer",
        :formulation => "Formulation",
        :carrier => "Carrier",
        :carrier_rate_acre => 1.5,
        :problem_target => "Problem Target"
      )
    ])
  end

  it "renders a list of supplies" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Supplyname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Supply Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Supply Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Distribution Unit".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Epa".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Formulation".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Carrier".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Problem Target".to_s, :count => 2
  end
end
