require 'spec_helper'

describe "pos/edit.html.erb" do
  before(:each) do
    @po = assign(:po, stub_model(Po,
      :new_record? => false,
      :ponumber => "MyString",
      :user_id => 1,
      :po_status => "MyString",
      :payment_type => "MyString",
      :payment_number => "MyString",
      :supplier_id => 1,
      :notes => "MyString",
      :po_type => "MyString",
      :order_amount => 1.5
    ))
  end

  it "renders the edit po form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => po_path(@po), :method => "post" do
      assert_select "input#po_ponumber", :name => "po[ponumber]"
      assert_select "input#po_user_id", :name => "po[user_id]"
      assert_select "input#po_po_status", :name => "po[po_status]"
      assert_select "input#po_payment_type", :name => "po[payment_type]"
      assert_select "input#po_payment_number", :name => "po[payment_number]"
      assert_select "input#po_supplier_id", :name => "po[supplier_id]"
      assert_select "input#po_notes", :name => "po[notes]"
      assert_select "input#po_po_type", :name => "po[po_type]"
      assert_select "input#po_order_amount", :name => "po[order_amount]"
    end
  end
end
