require 'spec_helper'

describe "partyroles/index.html.erb" do
  before(:each) do
    assign(:partyroles, [
      stub_model(Partyrole,
        :party_id => 1,
        :partytype_id => 1
      ),
      stub_model(Partyrole,
        :party_id => 1,
        :partytype_id => 1
      )
    ])
  end

  it "renders a list of partyroles" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
