require 'spec_helper'

describe "ztimes/edit.html.erb" do
  before(:each) do
    @ztime = assign(:ztime, stub_model(Ztime,
      :new_record? => false,
      :string => "",
      :string => ""
    ))
  end

  it "renders the edit ztime form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => ztime_path(@ztime), :method => "post" do
      assert_select "input#ztime_string", :name => "ztime[string]"
      assert_select "input#ztime_string", :name => "ztime[string]"
    end
  end
end
