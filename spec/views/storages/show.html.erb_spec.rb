require 'spec_helper'

describe "storages/show.html.erb" do
  before(:each) do
    @storage = assign(:storage, stub_model(Storage,
      :name => "Name",
      :type => "Type",
      :size => 1.5,
      :size_uom => "Size Uom",
      :location => "Location",
      :capacity => 1.5,
      :capacity_uom => "Capacity Uom"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Size Uom/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Location/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Capacity Uom/)
  end
end
