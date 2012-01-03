require 'spec_helper'

describe "equipmentactivities/show.html.erb" do
  before(:each) do
    @equipmentactivity = assign(:equipmentactivity, stub_model(Equipmentactivity,
      :equipment_id => 1,
      :user_id => 1,
      :activity => "Activity",
      :service_cost => 1.5,
      :service_notes => "Service Notes"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Activity/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Service Notes/)
  end
end
