require 'spec_helper'

describe "subscriptions/show.html.erb" do
  before(:each) do
    @subscription = assign(:subscription, stub_model(Subscription,
      :user_id => 1,
      :name_on_card => "Name On Card",
      :card_last4 => "Card Last4",
      :card_exp_month => "Card Exp Month",
      :card_exp_year => "Card Exp Year",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name On Card/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Card Last4/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Card Exp Month/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Card Exp Year/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Status/)
  end
end
