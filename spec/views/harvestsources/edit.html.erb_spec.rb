require 'spec_helper'

describe "harvestsources/edit.html.erb" do
  before(:each) do
    @harvestsource = assign(:harvestsource, stub_model(Harvestsource,
      :new_record? => false,
      :scaleticket_id => 1,
      :field_id => 1,
      :from_row => "MyString",
      :to_row => "MyString"
    ))
  end

  it "renders the edit harvestsource form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => harvestsource_path(@harvestsource), :method => "post" do
      assert_select "input#harvestsource_scaleticket_id", :name => "harvestsource[scaleticket_id]"
      assert_select "input#harvestsource_field_id", :name => "harvestsource[field_id]"
      assert_select "input#harvestsource_from_row", :name => "harvestsource[from_row]"
      assert_select "input#harvestsource_to_row", :name => "harvestsource[to_row]"
    end
  end
end
