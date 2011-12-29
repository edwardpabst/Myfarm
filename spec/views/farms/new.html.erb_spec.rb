require 'spec_helper'

describe "farms/new.html.erb" do
  before(:each) do
    assign(:farm, stub_model(Farm,
      :farmname => "MyString",
      :total_acres => 1.5
    ).as_new_record)
  end

  it "renders new farm form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => farms_path, :method => "post" do
      assert_select "input#farm_farmname", :name => "farm[farmname]"
      assert_select "input#farm_total_acres", :name => "farm[total_acres]"
    end
  end
end
