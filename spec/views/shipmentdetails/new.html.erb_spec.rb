require 'spec_helper'

describe "shipmentdetails/new.html.erb" do
  before(:each) do
    assign(:shipmentdetail, stub_model(Shipmentdetail,
      :inventorylot_id => 1,
      :price => 1.5,
      :qty => 1.5,
      :qty_uom => "MyString",
      :detail_status => "MyString",
      :cropplan_id => 1,
      :notes => "MyString"
    ).as_new_record)
  end

  it "renders new shipmentdetail form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => shipmentdetails_path, :method => "post" do
      assert_select "input#shipmentdetail_inventorylot_id", :name => "shipmentdetail[inventorylot_id]"
      assert_select "input#shipmentdetail_price", :name => "shipmentdetail[price]"
      assert_select "input#shipmentdetail_qty", :name => "shipmentdetail[qty]"
      assert_select "input#shipmentdetail_qty_uom", :name => "shipmentdetail[qty_uom]"
      assert_select "input#shipmentdetail_detail_status", :name => "shipmentdetail[detail_status]"
      assert_select "input#shipmentdetail_cropplan_id", :name => "shipmentdetail[cropplan_id]"
      assert_select "input#shipmentdetail_notes", :name => "shipmentdetail[notes]"
    end
  end
end
