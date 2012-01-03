require 'spec_helper'

describe "supplyinventory_trans/show.html.erb" do
  before(:each) do
    @supplyinventory_tran = assign(:supplyinventory_tran, stub_model(SupplyinventoryTran,
      :supplyinventory_id => 1,
      :supply_tran_type => "Supply Tran Type",
      :supply_tran_type_id => 1,
      :supply_tran_qty => 1.5,
      :supply_tran_cost => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Supply Tran Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
