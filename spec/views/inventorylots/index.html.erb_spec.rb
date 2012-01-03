require 'spec_helper'

describe "inventorylots/index.html.erb" do
  before(:each) do
    assign(:inventorylots, [
      stub_model(Inventorylot,
        :scaleticket_id => 1,
        :cropplan_id => 1,
        :inventory_uom => "Inventory Uom",
        :qty => 1.5,
        :grade => "Grade",
        :lab_report => "Lab Report",
        :storage_id => 1
      ),
      stub_model(Inventorylot,
        :scaleticket_id => 1,
        :cropplan_id => 1,
        :inventory_uom => "Inventory Uom",
        :qty => 1.5,
        :grade => "Grade",
        :lab_report => "Lab Report",
        :storage_id => 1
      )
    ])
  end

  it "renders a list of inventorylots" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Inventory Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Grade".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lab Report".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
