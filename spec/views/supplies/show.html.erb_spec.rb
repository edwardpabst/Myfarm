require 'spec_helper'

describe "supplies/show.html.erb" do
  before(:each) do
    @supply = assign(:supply, stub_model(Supply,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Supplyname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Supply Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Supply Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Distribution Unit/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Epa/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Manufacturer/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Formulation/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Carrier/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Problem Target/)
  end
end
