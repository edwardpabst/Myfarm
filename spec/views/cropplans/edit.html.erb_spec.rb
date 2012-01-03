require 'spec_helper'

describe "cropplans/edit.html.erb" do
  before(:each) do
    @cropplan = assign(:cropplan, stub_model(Cropplan,
      :new_record? => false,
      :crop_id => 1,
      :plan_year => "MyString",
      :plan_status => "MyString"
    ))
  end

  it "renders the edit cropplan form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => cropplan_path(@cropplan), :method => "post" do
      assert_select "input#cropplan_crop_id", :name => "cropplan[crop_id]"
      assert_select "input#cropplan_plan_year", :name => "cropplan[plan_year]"
      assert_select "input#cropplan_plan_status", :name => "cropplan[plan_status]"
    end
  end
end
