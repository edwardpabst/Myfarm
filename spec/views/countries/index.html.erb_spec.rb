require 'spec_helper'

describe "countries/index.html.erb" do
  before(:each) do
    assign(:countries, [
      stub_model(Country,
        :code2 => "Code2",
        :name => "Name",
        :namelc => "Namelc",
        :code3 => "Code3",
        :number => "Number"
      ),
      stub_model(Country,
        :code2 => "Code2",
        :name => "Name",
        :namelc => "Namelc",
        :code3 => "Code3",
        :number => "Number"
      )
    ])
  end

  it "renders a list of countries" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code2".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Namelc".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code3".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
