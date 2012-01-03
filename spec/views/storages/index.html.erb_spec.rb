require 'spec_helper'

describe "storages/index.html.erb" do
  before(:each) do
    assign(:storages, [
      stub_model(Storage,
        :name => "Name",
        :type => "Type",
        :size => 1.5,
        :size_uom => "Size Uom",
        :location => "Location",
        :capacity => 1.5,
        :capacity_uom => "Capacity Uom"
      ),
      stub_model(Storage,
        :name => "Name",
        :type => "Type",
        :size => 1.5,
        :size_uom => "Size Uom",
        :location => "Location",
        :capacity => 1.5,
        :capacity_uom => "Capacity Uom"
      )
    ])
  end

  it "renders a list of storages" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Size Uom".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Capacity Uom".to_s, :count => 2
  end
end
