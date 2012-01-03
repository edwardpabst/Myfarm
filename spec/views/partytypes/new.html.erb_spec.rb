require 'spec_helper'

describe "partytypes/new.html.erb" do
  before(:each) do
    assign(:partytype, stub_model(Partytype,
      :typedescription => "MyString",
      :typecode => "MyString"
    ).as_new_record)
  end

  it "renders new partytype form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => partytypes_path, :method => "post" do
      assert_select "input#partytype_typedescription", :name => "partytype[typedescription]"
      assert_select "input#partytype_typecode", :name => "partytype[typecode]"
    end
  end
end
