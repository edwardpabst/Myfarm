require 'spec_helper'

describe "fieldmappings/show.html.erb" do
  before(:each) do
    @fieldmapping = assign(:fieldmapping, stub_model(Fieldmapping))
  end

  it "renders attributes in <p>" do
    render
  end
end
