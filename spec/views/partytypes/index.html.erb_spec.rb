require 'spec_helper'

describe "partytypes/index.html.erb" do
  before(:each) do
    assign(:partytypes, [
      stub_model(Partytype,
        :typedescription => "Typedescription",
        :typecode => "Typecode"
      ),
      stub_model(Partytype,
        :typedescription => "Typedescription",
        :typecode => "Typecode"
      )
    ])
  end

  it "renders a list of partytypes" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Typedescription".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Typecode".to_s, :count => 2
  end
end
