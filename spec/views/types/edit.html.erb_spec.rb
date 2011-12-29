require 'spec_helper'

describe "types/edit.html.erb" do
  before(:each) do
    @type = assign(:type, stub_model(Type,
      :new_record? => false,
      :typename => "MyString",
      :type_value_string => "MyString",
      :type_value_integer => 1,
      :type_boolean => false
    ))
  end

  it "renders the edit type form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => type_path(@type), :method => "post" do
      assert_select "input#type_typename", :name => "type[typename]"
      assert_select "input#type_type_value_string", :name => "type[type_value_string]"
      assert_select "input#type_type_value_integer", :name => "type[type_value_integer]"
      assert_select "input#type_type_boolean", :name => "type[type_boolean]"
    end
  end
end
