require 'spec_helper'

describe "ztimes/new.html.erb" do
  before(:each) do
    assign(:ztime, stub_model(Ztime,
      :string => "",
      :string => ""
    ).as_new_record)
  end

  it "renders new ztime form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => ztimes_path, :method => "post" do
      assert_select "input#ztime_string", :name => "ztime[string]"
      assert_select "input#ztime_string", :name => "ztime[string]"
    end
  end
end
