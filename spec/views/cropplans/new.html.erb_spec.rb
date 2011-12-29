require 'spec_helper'

describe "cropplans/new.html.erb" do
  before(:each) do
    assign(:cropplan, stub_model(Cropplan,
      :crop_id => 1,
      :plan_year => "MyString",
      :plan_status => "MyString"
    ).as_new_record)
  end

  it "renders new cropplan form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => cropplans_path, :method => "post" do
      assert_select "input#cropplan_crop_id", :name => "cropplan[crop_id]"
      assert_select "input#cropplan_plan_year", :name => "cropplan[plan_year]"
      assert_select "input#cropplan_plan_status", :name => "cropplan[plan_status]"
    end
  end
end
