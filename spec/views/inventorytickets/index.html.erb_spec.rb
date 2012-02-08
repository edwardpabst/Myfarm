require 'spec_helper'

describe "inventorytickets/index.html.erb" do
  before(:each) do
    assign(:inventorytickets, [
      stub_model(Inventoryticket,
        :scaleticket_id => 1,
        :field_id => 1,
        :pack_qty => 1,
        :inventory_uom => "Inventory Uom",
        :inventorylot_id => 1
      ),
      stub_model(Inventoryticket,
        :scaleticket_id => 1,
        :field_id => 1,
        :pack_qty => 1,
        :inventory_uom => "Inventory Uom",
        :inventorylot_id => 1
      )
    ])
  end

  it "renders a list of inventorytickets" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Inventory Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
