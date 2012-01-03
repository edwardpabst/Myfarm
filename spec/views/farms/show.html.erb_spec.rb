require 'spec_helper'

describe "farms/show.html.erb" do
  before(:each) do
    @farm = assign(:farm, stub_model(Farm,
      :farmname => "Farmname",
      :total_acres => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Farmname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
