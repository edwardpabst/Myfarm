require 'spec_helper'

describe "crops/edit.html.erb" do
  before(:each) do
    @crop = assign(:crop, stub_model(Crop,
      :new_record? => false,
      :cropname => "MyString",
      :croptype => "MyString",
      :cropspecific => "MyString"
    ))
  end

  it "renders the edit crop form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => crop_path(@crop), :method => "post" do
      assert_select "input#crop_cropname", :name => "crop[cropname]"
      assert_select "input#crop_croptype", :name => "crop[croptype]"
      assert_select "input#crop_cropspecific", :name => "crop[cropspecific]"
    end
  end
end
