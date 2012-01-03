require 'spec_helper'

describe "countries/new.html.erb" do
  before(:each) do
    assign(:country, stub_model(Country,
      :code2 => "MyString",
      :name => "MyString",
      :namelc => "MyString",
      :code3 => "MyString",
      :number => "MyString"
    ).as_new_record)
  end

  it "renders new country form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => countries_path, :method => "post" do
      assert_select "input#country_code2", :name => "country[code2]"
      assert_select "input#country_name", :name => "country[name]"
      assert_select "input#country_namelc", :name => "country[namelc]"
      assert_select "input#country_code3", :name => "country[code3]"
      assert_select "input#country_number", :name => "country[number]"
    end
  end
end
