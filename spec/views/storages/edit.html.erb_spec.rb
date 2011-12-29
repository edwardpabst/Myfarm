require 'spec_helper'

describe "storages/edit.html.erb" do
  before(:each) do
    @storage = assign(:storage, stub_model(Storage,
      :new_record? => false,
      :name => "MyString",
      :type => "MyString",
      :size => 1.5,
      :size_uom => "MyString",
      :location => "MyString",
      :capacity => 1.5,
      :capacity_uom => "MyString"
    ))
  end

  it "renders the edit storage form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => storage_path(@storage), :method => "post" do
      assert_select "input#storage_name", :name => "storage[name]"
      assert_select "input#storage_type", :name => "storage[type]"
      assert_select "input#storage_size", :name => "storage[size]"
      assert_select "input#storage_size_uom", :name => "storage[size_uom]"
      assert_select "input#storage_location", :name => "storage[location]"
      assert_select "input#storage_capacity", :name => "storage[capacity]"
      assert_select "input#storage_capacity_uom", :name => "storage[capacity_uom]"
    end
  end
end
