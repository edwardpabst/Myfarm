require 'spec_helper'

describe "crops/new.html.erb" do
  before(:each) do
    assign(:crop, stub_model(Crop,
      :cropname => "MyString",
      :croptype => "MyString",
      :cropspecific => "MyString"
    ).as_new_record)
  end

  it "renders new crop form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => crops_path, :method => "post" do
      assert_select "input#crop_cropname", :name => "crop[cropname]"
      assert_select "input#crop_croptype", :name => "crop[croptype]"
      assert_select "input#crop_cropspecific", :name => "crop[cropspecific]"
    end
  end
end
