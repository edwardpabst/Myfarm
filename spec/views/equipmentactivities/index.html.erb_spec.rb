require 'spec_helper'

describe "equipmentactivities/index.html.erb" do
  before(:each) do
    assign(:equipmentactivities, [
      stub_model(Equipmentactivity,
        :equipment_id => 1,
        :user_id => 1,
        :activity => "Activity",
        :service_cost => 1.5,
        :service_notes => "Service Notes"
      ),
      stub_model(Equipmentactivity,
        :equipment_id => 1,
        :user_id => 1,
        :activity => "Activity",
        :service_cost => 1.5,
        :service_notes => "Service Notes"
      )
    ])
  end

  it "renders a list of equipmentactivities" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Activity".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Service Notes".to_s, :count => 2
  end
end
