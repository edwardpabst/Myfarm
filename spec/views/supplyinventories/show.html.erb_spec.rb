require 'spec_helper'

describe "supplyinventories/show.html.erb" do
  before(:each) do
    @supplyinventory = assign(:supplyinventory, stub_model(Supplyinventory,
      :supply_id => 1,
      :supply_uom => "Supply Uom",
      :user_id => 1,
      :storage_id => 1,
      :qty_in => 1.5,
      :qty_onhand => 1.5,
      :qty_out => 1.5,
      :onhand_value => 1.5,
      :avg_cost => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Supply Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
