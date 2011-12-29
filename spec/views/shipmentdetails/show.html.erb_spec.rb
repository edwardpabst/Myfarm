require 'spec_helper'

describe "shipmentdetails/show.html.erb" do
  before(:each) do
    @shipmentdetail = assign(:shipmentdetail, stub_model(Shipmentdetail,
      :inventorylot_id => 1,
      :price => 1.5,
      :qty => 1.5,
      :qty_uom => "Qty Uom",
      :detail_status => "Detail Status",
      :cropplan_id => 1,
      :notes => "Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Qty Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Detail Status/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Notes/)
  end
end
