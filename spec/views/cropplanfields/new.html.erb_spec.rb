require 'spec_helper'

describe "cropplanfields/new.html.erb" do
  before(:each) do
    assign(:cropplanfield, stub_model(Cropplanfield,
      :cropplan_id => 1,
      :field_id => 1,
      :plan_acres => "9.99",
      :avg_yield => 1,
      :yield_uom => "MyString"
    ).as_new_record)
  end

  it "renders new cropplanfield form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => cropplanfields_path, :method => "post" do
      assert_select "input#cropplanfield_cropplan_id", :name => "cropplanfield[cropplan_id]"
      assert_select "input#cropplanfield_field_id", :name => "cropplanfield[field_id]"
      assert_select "input#cropplanfield_plan_acres", :name => "cropplanfield[plan_acres]"
      assert_select "input#cropplanfield_avg_yield", :name => "cropplanfield[avg_yield]"
      assert_select "input#cropplanfield_yield_uom", :name => "cropplanfield[yield_uom]"
    end
  end
end
