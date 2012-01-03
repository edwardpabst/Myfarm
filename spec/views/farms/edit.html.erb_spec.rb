require 'spec_helper'

describe "farms/edit.html.erb" do
  before(:each) do
    @farm = assign(:farm, stub_model(Farm,
      :new_record? => false,
      :farmname => "MyString",
      :total_acres => 1.5
    ))
  end

  it "renders the edit farm form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farm_path(@farm), :method => "post" do
      assert_select "input#farm_farmname", :name => "farm[farmname]"
      assert_select "input#farm_total_acres", :name => "farm[total_acres]"
    end
  end
end
