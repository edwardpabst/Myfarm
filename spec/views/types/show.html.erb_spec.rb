require 'spec_helper'

describe "types/show.html.erb" do
  before(:each) do
    @type = assign(:type, stub_model(Type,
      :typename => "Typename",
      :type_value_string => "Type Value String",
      :type_value_integer => 1,
      :type_boolean => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Typename/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Type Value String/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
