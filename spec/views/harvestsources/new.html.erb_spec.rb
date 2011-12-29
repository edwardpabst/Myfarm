require 'spec_helper'

describe "harvestsources/new.html.erb" do
  before(:each) do
    assign(:harvestsource, stub_model(Harvestsource,
      :scaleticket_id => 1,
      :field_id => 1,
      :from_row => "MyString",
      :to_row => "MyString"
    ).as_new_record)
  end

  it "renders new harvestsource form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => harvestsources_path, :method => "post" do
      assert_select "input#harvestsource_scaleticket_id", :name => "harvestsource[scaleticket_id]"
      assert_select "input#harvestsource_field_id", :name => "harvestsource[field_id]"
      assert_select "input#harvestsource_from_row", :name => "harvestsource[from_row]"
      assert_select "input#harvestsource_to_row", :name => "harvestsource[to_row]"
    end
  end
end
