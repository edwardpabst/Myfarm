require 'spec_helper'

describe "fieldmappings/index.html.erb" do
  before(:each) do
    assign(:fieldmappings, [
      stub_model(Fieldmapping),
      stub_model(Fieldmapping)
    ])
  end

  it "renders a list of fieldmappings" do
    render
  end
end
