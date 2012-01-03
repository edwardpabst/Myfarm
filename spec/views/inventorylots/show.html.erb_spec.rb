require 'spec_helper'

describe "inventorylots/show.html.erb" do
  before(:each) do
    @inventorylot = assign(:inventorylot, stub_model(Inventorylot,
      :scaleticket_id => 1,
      :cropplan_id => 1,
      :inventory_uom => "Inventory Uom",
      :qty => 1.5,
      :grade => "Grade",
      :lab_report => "Lab Report",
      :storage_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Inventory Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Grade/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Lab Report/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
