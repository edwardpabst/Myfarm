require 'spec_helper'

describe "types/index.html.erb" do
  before(:each) do
    assign(:types, [
      stub_model(Type,
        :typename => "Typename",
        :type_value_string => "Type Value String",
        :type_value_integer => 1,
        :type_boolean => false
      ),
      stub_model(Type,
        :typename => "Typename",
        :type_value_string => "Type Value String",
        :type_value_integer => 1,
        :type_boolean => false
      )
    ])
  end

  it "renders a list of types" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Typename".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Value String".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
