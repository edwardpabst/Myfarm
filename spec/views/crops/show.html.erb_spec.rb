require 'spec_helper'

describe "crops/show.html.erb" do
  before(:each) do
    @crop = assign(:crop, stub_model(Crop,
      :cropname => "Cropname",
      :croptype => "Croptype",
      :cropspecific => "Cropspecific"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Cropname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Croptype/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Cropspecific/)
  end
end
