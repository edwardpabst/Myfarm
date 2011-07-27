require 'spec_helper'

describe "parties/show.html.erb" do
  before(:each) do
    @party = assign(:party, stub_model(Party,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partyname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partylastname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partyfirstname/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partyaddress1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partyaddress2/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partycity/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partystate/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partypostalcode/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partycountry/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partyphone/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partyemail/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Partyjobtitle/)
  end
end
