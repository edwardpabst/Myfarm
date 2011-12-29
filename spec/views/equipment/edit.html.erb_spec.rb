require 'spec_helper'

describe "equipment/edit.html.erb" do
  before(:each) do
    @equipment = assign(:equipment, stub_model(Equipment,
      :new_record? => false,
      :description => "MyString",
      :user_id => 1,
      :category => "MyString",
      :make => "MyString",
      :model => "MyString",
      :year => "",
      :cost_unit => "",
      :cost_rate_hour => "",
      :width => "",
      :photo_path => "MyString",
      :frequency_hours => ""
    ))
  end

  it "renders the edit equipment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => equipment_path(@equipment), :method => "post" do
      assert_select "input#equipment_description", :name => "equipment[description]"
      assert_select "input#equipment_user_id", :name => "equipment[user_id]"
      assert_select "input#equipment_category", :name => "equipment[category]"
      assert_select "input#equipment_make", :name => "equipment[make]"
      assert_select "input#equipment_model", :name => "equipment[model]"
      assert_select "input#equipment_year", :name => "equipment[year]"
      assert_select "input#equipment_cost_unit", :name => "equipment[cost_unit]"
      assert_select "input#equipment_cost_rate_hour", :name => "equipment[cost_rate_hour]"
      assert_select "input#equipment_width", :name => "equipment[width]"
      assert_select "input#equipment_photo_path", :name => "equipment[photo_path]"
      assert_select "input#equipment_frequency_hours", :name => "equipment[frequency_hours]"
    end
  end
end
