require 'spec_helper'

describe "cropplanfields/show.html.erb" do
  before(:each) do
    @cropplanfield = assign(:cropplanfield, stub_model(Cropplanfield,
      :cropplan_id => 1,
      :field_id => 1,
      :plan_acres => "9.99",
      :avg_yield => 1,
      :yield_uom => "Yield Uom"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Yield Uom/)
  end
end
