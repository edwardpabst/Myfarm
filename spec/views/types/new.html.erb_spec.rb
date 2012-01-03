require 'spec_helper'

describe "types/new.html.erb" do
  before(:each) do
    assign(:type, stub_model(Type,
      :typename => "MyString",
      :type_value_string => "MyString",
      :type_value_integer => 1,
      :type_boolean => false
    ).as_new_record)
  end

  it "renders new type form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => types_path, :method => "post" do
      assert_select "input#type_typename", :name => "type[typename]"
      assert_select "input#type_type_value_string", :name => "type[type_value_string]"
      assert_select "input#type_type_value_integer", :name => "type[type_value_integer]"
      assert_select "input#type_type_boolean", :name => "type[type_boolean]"
    end
  end
end
