require 'spec_helper'

describe "inventorylots/new.html.erb" do
  before(:each) do
    assign(:inventorylot, stub_model(Inventorylot,
      :scaleticket_id => 1,
      :cropplan_id => 1,
      :inventory_uom => "MyString",
      :qty => 1.5,
      :grade => "MyString",
      :lab_report => "MyString",
      :storage_id => 1
    ).as_new_record)
  end

  it "renders new inventorylot form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => inventorylots_path, :method => "post" do
      assert_select "input#inventorylot_scaleticket_id", :name => "inventorylot[scaleticket_id]"
      assert_select "input#inventorylot_cropplan_id", :name => "inventorylot[cropplan_id]"
      assert_select "input#inventorylot_inventory_uom", :name => "inventorylot[inventory_uom]"
      assert_select "input#inventorylot_qty", :name => "inventorylot[qty]"
      assert_select "input#inventorylot_grade", :name => "inventorylot[grade]"
      assert_select "input#inventorylot_lab_report", :name => "inventorylot[lab_report]"
      assert_select "input#inventorylot_storage_id", :name => "inventorylot[storage_id]"
    end
  end
end
