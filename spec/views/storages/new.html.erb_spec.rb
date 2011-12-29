require 'spec_helper'

describe "storages/new.html.erb" do
  before(:each) do
    assign(:storage, stub_model(Storage,
      :name => "MyString",
      :type => "MyString",
      :size => 1.5,
      :size_uom => "MyString",
      :location => "MyString",
      :capacity => 1.5,
      :capacity_uom => "MyString"
    ).as_new_record)
  end

  it "renders new storage form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => storages_path, :method => "post" do
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
