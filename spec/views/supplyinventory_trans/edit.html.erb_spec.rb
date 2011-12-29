require 'spec_helper'

describe "supplyinventory_trans/edit.html.erb" do
  before(:each) do
    @supplyinventory_tran = assign(:supplyinventory_tran, stub_model(SupplyinventoryTran,
      :new_record? => false,
      :supplyinventory_id => 1,
      :supply_tran_type => "MyString",
      :supply_tran_type_id => 1,
      :supply_tran_qty => 1.5,
      :supply_tran_cost => 1.5
    ))
  end

  it "renders the edit supplyinventory_tran form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => supplyinventory_tran_path(@supplyinventory_tran), :method => "post" do
      assert_select "input#supplyinventory_tran_supplyinventory_id", :name => "supplyinventory_tran[supplyinventory_id]"
      assert_select "input#supplyinventory_tran_supply_tran_type", :name => "supplyinventory_tran[supply_tran_type]"
      assert_select "input#supplyinventory_tran_supply_tran_type_id", :name => "supplyinventory_tran[supply_tran_type_id]"
      assert_select "input#supplyinventory_tran_supply_tran_qty", :name => "supplyinventory_tran[supply_tran_qty]"
      assert_select "input#supplyinventory_tran_supply_tran_cost", :name => "supplyinventory_tran[supply_tran_cost]"
    end
  end
end
