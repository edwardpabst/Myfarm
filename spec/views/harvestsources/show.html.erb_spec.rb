require 'spec_helper'

describe "harvestsources/show.html.erb" do
  before(:each) do
    @harvestsource = assign(:harvestsource, stub_model(Harvestsource,
      :scaleticket_id => 1,
      :field_id => 1,
      :from_row => "From Row",
      :to_row => "To Row"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/From Row/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/To Row/)
  end
end
