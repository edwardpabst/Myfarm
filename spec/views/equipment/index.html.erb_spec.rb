require 'spec_helper'

describe "equipment/index.html.erb" do
  before(:each) do
    assign(:equipment, [
      stub_model(Equipment,
        :description => "Description",
        :user_id => 1,
        :category => "Category",
        :make => "Make",
        :model => "Model",
        :year => "",
        :cost_unit => "",
        :cost_rate_hour => "",
        :width => "",
        :photo_path => "Photo Path",
        :frequency_hours => ""
      ),
      stub_model(Equipment,
        :description => "Description",
        :user_id => 1,
        :category => "Category",
        :make => "Make",
        :model => "Model",
        :year => "",
        :cost_unit => "",
        :cost_rate_hour => "",
        :width => "",
        :photo_path => "Photo Path",
        :frequency_hours => ""
      )
    ])
  end

  it "renders a list of equipment" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Photo Path".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
