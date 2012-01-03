require 'spec_helper'

describe "countries/show.html.erb" do
  before(:each) do
    @country = assign(:country, stub_model(Country,
      :code2 => "Code2",
      :name => "Name",
      :namelc => "Namelc",
      :code3 => "Code3",
      :number => "Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Code2/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Namelc/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Code3/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Number/)
  end
end
