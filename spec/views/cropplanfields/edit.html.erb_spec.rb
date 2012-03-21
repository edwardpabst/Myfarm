require 'spec_helper'

describe "cropplanfields/edit.html.erb" do
  before(:each) do
    @cropplanfield = assign(:cropplanfield, stub_model(Cropplanfield,
      :new_record? => false,
      :cropplan_id => 1,
      :field_id => 1,
      :plan_acres => "9.99",
      :avg_yield => 1,
      :yield_uom => "MyString"
    ))
  end

  it "renders the edit cropplanfield form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => cropplanfield_path(@cropplanfield), :method => "post" do
      assert_select "input#cropplanfield_cropplan_id", :name => "cropplanfield[cropplan_id]"
      assert_select "input#cropplanfield_field_id", :name => "cropplanfield[field_id]"
      assert_select "input#cropplanfield_plan_acres", :name => "cropplanfield[plan_acres]"
      assert_select "input#cropplanfield_avg_yield", :name => "cropplanfield[avg_yield]"
      assert_select "input#cropplanfield_yield_uom", :name => "cropplanfield[yield_uom]"
    end
  end
end
