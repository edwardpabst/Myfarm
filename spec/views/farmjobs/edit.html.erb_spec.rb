require 'spec_helper'

describe "farmjobs/edit.html.erb" do
  before(:each) do
    @farmjob = assign(:farmjob, stub_model(Farmjob,
      :new_record? => false,
      :user_id => 1,
      :fieldtask_id => 1,
      :field_id => 1,
      :crop_id => 1,
      :area_size => 1.5,
      :total_hours => 1.5,
      :notes => "MyString",
      :equipment_id => 1,
      :applied_area => 1.5,
      :plan_rate => 1.5,
      :actual_rate => 1.5,
      :growth_stage => "MyString",
      :application_method => "MyString",
      :soil_condition => "MyString",
      :soil_type => "MyString",
      :weather_segment => "MyString"
    ))
  end

  it "renders the edit farmjob form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farmjob_path(@farmjob), :method => "post" do
      assert_select "input#farmjob_user_id", :name => "farmjob[user_id]"
      assert_select "input#farmjob_fieldtask_id", :name => "farmjob[fieldtask_id]"
      assert_select "input#farmjob_field_id", :name => "farmjob[field_id]"
      assert_select "input#farmjob_crop_id", :name => "farmjob[crop_id]"
      assert_select "input#farmjob_area_size", :name => "farmjob[area_size]"
      assert_select "input#farmjob_total_hours", :name => "farmjob[total_hours]"
      assert_select "input#farmjob_notes", :name => "farmjob[notes]"
      assert_select "input#farmjob_equipment_id", :name => "farmjob[equipment_id]"
      assert_select "input#farmjob_applied_area", :name => "farmjob[applied_area]"
      assert_select "input#farmjob_plan_rate", :name => "farmjob[plan_rate]"
      assert_select "input#farmjob_actual_rate", :name => "farmjob[actual_rate]"
      assert_select "input#farmjob_growth_stage", :name => "farmjob[growth_stage]"
      assert_select "input#farmjob_application_method", :name => "farmjob[application_method]"
      assert_select "input#farmjob_soil_condition", :name => "farmjob[soil_condition]"
      assert_select "input#farmjob_soil_type", :name => "farmjob[soil_type]"
      assert_select "input#farmjob_weather_segment", :name => "farmjob[weather_segment]"
    end
  end
end
