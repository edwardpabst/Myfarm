require 'spec_helper'

describe "crops/index.html.erb" do
  before(:each) do
    assign(:crops, [
      stub_model(Crop,
        :cropname => "Cropname",
        :croptype => "Croptype",
        :cropspecific => "Cropspecific"
      ),
      stub_model(Crop,
        :cropname => "Cropname",
        :croptype => "Croptype",
        :cropspecific => "Cropspecific"
      )
    ])
  end

  it "renders a list of crops" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cropname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Croptype".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cropspecific".to_s, :count => 2
  end
end
