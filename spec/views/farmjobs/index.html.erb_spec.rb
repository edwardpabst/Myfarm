require 'spec_helper'

describe "farmjobs/index.html.erb" do
  before(:each) do
    assign(:farmjobs, [
      stub_model(Farmjob,
        :user_id => 1,
        :fieldtask_id => 1,
        :field_id => 1,
        :crop_id => 1,
        :area_size => 1.5,
        :total_hours => 1.5,
        :notes => "Notes",
        :equipment_id => 1,
        :applied_area => 1.5,
        :plan_rate => 1.5,
        :actual_rate => 1.5,
        :growth_stage => "Growth Stage",
        :application_method => "Application Method",
        :soil_condition => "Soil Condition",
        :soil_type => "Soil Type",
        :weather_segment => "Weather Segment"
      ),
      stub_model(Farmjob,
        :user_id => 1,
        :fieldtask_id => 1,
        :field_id => 1,
        :crop_id => 1,
        :area_size => 1.5,
        :total_hours => 1.5,
        :notes => "Notes",
        :equipment_id => 1,
        :applied_area => 1.5,
        :plan_rate => 1.5,
        :actual_rate => 1.5,
        :growth_stage => "Growth Stage",
        :application_method => "Application Method",
        :soil_condition => "Soil Condition",
        :soil_type => "Soil Type",
        :weather_segment => "Weather Segment"
      )
    ])
  end

  it "renders a list of farmjobs" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Growth Stage".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Application Method".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Soil Condition".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Soil Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Weather Segment".to_s, :count => 2
  end
end
