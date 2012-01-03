require 'spec_helper'

describe "ztimes/index.html.erb" do
  before(:each) do
    assign(:ztimes, [
      stub_model(Ztime,
        :string => "",
        :string => ""
      ),
      stub_model(Ztime,
        :string => "",
        :string => ""
      )
    ])
  end

  it "renders a list of ztimes" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
