require 'spec_helper'

describe "parties/edit.html.erb" do
  before(:each) do
    @party = assign(:party, stub_model(Party,
      :new_record? => false,
      :userid => 1,
      :partyname => "MyString",
      :partylastname => "MyString",
      :partyfirstname => "MyString",
      :partyaddress1 => "MyString",
      :partyaddress2 => "MyString",
      :partycity => "MyString",
      :partystate => "MyString",
      :partypostalcode => "MyString",
      :partycountry => "MyString",
      :partyphone => "MyString",
      :partyemail => "MyString",
      :partyjobtitle => "MyString"
    ))
  end

  it "renders the edit party form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => party_path(@party), :method => "post" do
      assert_select "input#party_userid", :name => "party[userid]"
      assert_select "input#party_partyname", :name => "party[partyname]"
      assert_select "input#party_partylastname", :name => "party[partylastname]"
      assert_select "input#party_partyfirstname", :name => "party[partyfirstname]"
      assert_select "input#party_partyaddress1", :name => "party[partyaddress1]"
      assert_select "input#party_partyaddress2", :name => "party[partyaddress2]"
      assert_select "input#party_partycity", :name => "party[partycity]"
      assert_select "input#party_partystate", :name => "party[partystate]"
      assert_select "input#party_partypostalcode", :name => "party[partypostalcode]"
      assert_select "input#party_partycountry", :name => "party[partycountry]"
      assert_select "input#party_partyphone", :name => "party[partyphone]"
      assert_select "input#party_partyemail", :name => "party[partyemail]"
      assert_select "input#party_partyjobtitle", :name => "party[partyjobtitle]"
    end
  end
end
