require 'spec_helper'

describe "partytypes/show.html.erb" do
  before(:each) do
    @partytype = assign(:partytype, stub_model(Partytype,
      :typedescription => "Typedescription",
      :typecode => "Typecode"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Typedescription/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Typecode/)
  end
end
