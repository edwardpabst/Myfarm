require 'spec_helper'

describe "countries/edit.html.erb" do
  before(:each) do
    @country = assign(:country, stub_model(Country,
      :new_record? => false,
      :code2 => "MyString",
      :name => "MyString",
      :namelc => "MyString",
      :code3 => "MyString",
      :number => "MyString"
    ))
  end

  it "renders the edit country form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => country_path(@country), :method => "post" do
      assert_select "input#country_code2", :name => "country[code2]"
      assert_select "input#country_name", :name => "country[name]"
      assert_select "input#country_namelc", :name => "country[namelc]"
      assert_select "input#country_code3", :name => "country[code3]"
      assert_select "input#country_number", :name => "country[number]"
    end
  end
end
