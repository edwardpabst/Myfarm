require 'spec_helper'

describe "supplies/edit.html.erb" do
  before(:each) do
    @supply = assign(:supply, stub_model(Supply,
      :new_record? => false,
      :user_id => 1,
      :supplyname => "MyString",
      :supply_type => "MyString",
      :supply_uom => "MyString",
      :supply_cost_uom => 1.5,
      :distribution_unit => "MyString",
      :rate_acre => 1.5,
      :epa_id => "MyString",
      :manufacturer => "MyString",
      :formulation => "MyString",
      :carrier => "MyString",
      :carrier_rate_acre => 1.5,
      :problem_target => "MyString"
    ))
  end

  it "renders the edit supply form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => supply_path(@supply), :method => "post" do
      assert_select "input#supply_user_id", :name => "supply[user_id]"
      assert_select "input#supply_supplyname", :name => "supply[supplyname]"
      assert_select "input#supply_supply_type", :name => "supply[supply_type]"
      assert_select "input#supply_supply_uom", :name => "supply[supply_uom]"
      assert_select "input#supply_supply_cost_uom", :name => "supply[supply_cost_uom]"
      assert_select "input#supply_distribution_unit", :name => "supply[distribution_unit]"
      assert_select "input#supply_rate_acre", :name => "supply[rate_acre]"
      assert_select "input#supply_epa_id", :name => "supply[epa_id]"
      assert_select "input#supply_manufacturer", :name => "supply[manufacturer]"
      assert_select "input#supply_formulation", :name => "supply[formulation]"
      assert_select "input#supply_carrier", :name => "supply[carrier]"
      assert_select "input#supply_carrier_rate_acre", :name => "supply[carrier_rate_acre]"
      assert_select "input#supply_problem_target", :name => "supply[problem_target]"
    end
  end
end
