require 'spec_helper'

describe "parties/index.html.erb" do
  before(:each) do
    assign(:parties, [
      stub_model(Party,
        :userid => 1,
        :partyname => "Partyname",
        :partylastname => "Partylastname",
        :partyfirstname => "Partyfirstname",
        :partyaddress1 => "Partyaddress1",
        :partyaddress2 => "Partyaddress2",
        :partycity => "Partycity",
        :partystate => "Partystate",
        :partypostalcode => "Partypostalcode",
        :partycountry => "Partycountry",
        :partyphone => "Partyphone",
        :partyemail => "Partyemail",
        :partyjobtitle => "Partyjobtitle"
      ),
      stub_model(Party,
        :userid => 1,
        :partyname => "Partyname",
        :partylastname => "Partylastname",
        :partyfirstname => "Partyfirstname",
        :partyaddress1 => "Partyaddress1",
        :partyaddress2 => "Partyaddress2",
        :partycity => "Partycity",
        :partystate => "Partystate",
        :partypostalcode => "Partypostalcode",
        :partycountry => "Partycountry",
        :partyphone => "Partyphone",
        :partyemail => "Partyemail",
        :partyjobtitle => "Partyjobtitle"
      )
    ])
  end

  it "renders a list of parties" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partyname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partylastname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partyfirstname".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partyaddress1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partyaddress2".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partycity".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partystate".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partypostalcode".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partycountry".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partyphone".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partyemail".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Partyjobtitle".to_s, :count => 2
  end
end
