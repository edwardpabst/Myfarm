require 'spec_helper'

describe "cropplans/show.html.erb" do
  before(:each) do
    @cropplan = assign(:cropplan, stub_model(Cropplan,
      :crop_id => 1,
      :plan_year => "Plan Year",
      :plan_status => "Plan Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Plan Year/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Plan Status/)
  end
end
