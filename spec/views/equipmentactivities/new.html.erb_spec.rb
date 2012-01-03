require 'spec_helper'

describe "equipmentactivities/new.html.erb" do
  before(:each) do
    assign(:equipmentactivity, stub_model(Equipmentactivity,
      :equipment_id => 1,
      :user_id => 1,
      :activity => "MyString",
      :service_cost => 1.5,
      :service_notes => "MyString"
    ).as_new_record)
  end

  it "renders new equipmentactivity form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => equipmentactivities_path, :method => "post" do
      assert_select "input#equipmentactivity_equipment_id", :name => "equipmentactivity[equipment_id]"
      assert_select "input#equipmentactivity_user_id", :name => "equipmentactivity[user_id]"
      assert_select "input#equipmentactivity_activity", :name => "equipmentactivity[activity]"
      assert_select "input#equipmentactivity_service_cost", :name => "equipmentactivity[service_cost]"
      assert_select "input#equipmentactivity_service_notes", :name => "equipmentactivity[service_notes]"
    end
  end
end
