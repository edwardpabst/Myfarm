require 'spec_helper'

describe "retailorderdetails/show.html.erb" do
  before(:each) do
    @retailorderdetail = assign(:retailorderdetail, stub_model(Retailorderdetail,
      :user_id => 1,
      :retailcrop_id => 1,
      :cropplan_id => 1,
      :detail_uom => "Detail Uom",
      :detail_price => "9.99",
      :detail_qty => "9.99",
      :detail_ext_amount => "9.99",
      :detail_shipcharge => "9.99",
      :detail_status => "Detail Status"
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
    rendered.should match(/Detail Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Detail Status/)
  end
end
