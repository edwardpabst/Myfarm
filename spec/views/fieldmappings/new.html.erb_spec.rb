require 'spec_helper'

describe "fieldmappings/new.html.erb" do
  before(:each) do
    assign(:fieldmapping, stub_model(Fieldmapping).as_new_record)
  end

  it "renders new fieldmapping form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fieldmappings_path, :method => "post" do
    end
  end
end
