require 'spec_helper'

describe "inventorytickets/new.html.erb" do
  before(:each) do
    assign(:inventoryticket, stub_model(Inventoryticket,
      :scaleticket_id => 1,
      :field_id => 1,
      :pack_qty => 1,
      :inventory_uom => "MyString",
      :inventorylot_id => 1
    ).as_new_record)
  end

  it "renders new inventoryticket form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => inventorytickets_path, :method => "post" do
      assert_select "input#inventoryticket_scaleticket_id", :name => "inventoryticket[scaleticket_id]"
      assert_select "input#inventoryticket_field_id", :name => "inventoryticket[field_id]"
      assert_select "input#inventoryticket_pack_qty", :name => "inventoryticket[pack_qty]"
      assert_select "input#inventoryticket_inventory_uom", :name => "inventoryticket[inventory_uom]"
      assert_select "input#inventoryticket_inventorylot_id", :name => "inventoryticket[inventorylot_id]"
    end
  end
end
