require 'spec_helper'

describe "fieldmappings/edit.html.erb" do
  before(:each) do
    @fieldmapping = assign(:fieldmapping, stub_model(Fieldmapping,
      :new_record? => false
    ))
  end

  it "renders the edit fieldmapping form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fieldmapping_path(@fieldmapping), :method => "post" do
    end
  end
end
