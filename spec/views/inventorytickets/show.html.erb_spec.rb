require 'spec_helper'

describe "inventorytickets/show.html.erb" do
  before(:each) do
    @inventoryticket = assign(:inventoryticket, stub_model(Inventoryticket,
      :scaleticket_id => 1,
      :field_id => 1,
      :pack_qty => 1,
      :inventory_uom => "Inventory Uom",
      :inventorylot_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Inventory Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
