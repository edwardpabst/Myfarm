require 'spec_helper'

describe "ztimes/show.html.erb" do
  before(:each) do
    @ztime = assign(:ztime, stub_model(Ztime,
      :string => "",
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
