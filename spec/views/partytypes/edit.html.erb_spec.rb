require 'spec_helper'

describe "partytypes/edit.html.erb" do
  before(:each) do
    @partytype = assign(:partytype, stub_model(Partytype,
      :new_record? => false,
      :typedescription => "MyString",
      :typecode => "MyString"
    ))
  end

  it "renders the edit partytype form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => partytype_path(@partytype), :method => "post" do
      assert_select "input#partytype_typedescription", :name => "partytype[typedescription]"
      assert_select "input#partytype_typecode", :name => "partytype[typecode]"
    end
  end
end
