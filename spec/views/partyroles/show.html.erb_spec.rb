require 'spec_helper'

describe "partyroles/show.html.erb" do
  before(:each) do
    @partyrole = assign(:partyrole, stub_model(Partyrole,
      :party_id => 1,
      :partytype_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
