require 'spec_helper'

describe "supplyinventories/new.html.erb" do
  before(:each) do
    assign(:supplyinventory, stub_model(Supplyinventory,
      :supply_id => 1,
      :supply_uom => "MyString",
      :user_id => 1,
      :storage_id => 1,
      :qty_in => 1.5,
      :qty_onhand => 1.5,
      :qty_out => 1.5,
      :onhand_value => 1.5,
      :avg_cost => 1.5
    ).as_new_record)
  end

  it "renders new supplyinventory form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => supplyinventories_path, :method => "post" do
      assert_select "input#supplyinventory_supply_id", :name => "supplyinventory[supply_id]"
      assert_select "input#supplyinventory_supply_uom", :name => "supplyinventory[supply_uom]"
      assert_select "input#supplyinventory_user_id", :name => "supplyinventory[user_id]"
      assert_select "input#supplyinventory_storage_id", :name => "supplyinventory[storage_id]"
      assert_select "input#supplyinventory_qty_in", :name => "supplyinventory[qty_in]"
      assert_select "input#supplyinventory_qty_onhand", :name => "supplyinventory[qty_onhand]"
      assert_select "input#supplyinventory_qty_out", :name => "supplyinventory[qty_out]"
      assert_select "input#supplyinventory_onhand_value", :name => "supplyinventory[onhand_value]"
      assert_select "input#supplyinventory_avg_cost", :name => "supplyinventory[avg_cost]"
    end
  end
end
