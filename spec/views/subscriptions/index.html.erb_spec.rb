require 'spec_helper'

describe "subscriptions/index.html.erb" do
  before(:each) do
    assign(:subscriptions, [
      stub_model(Subscription,
        :user_id => 1,
        :name_on_card => "Name On Card",
        :card_last4 => "Card Last4",
        :card_exp_month => "Card Exp Month",
        :card_exp_year => "Card Exp Year",
        :status => "Status"
      ),
      stub_model(Subscription,
        :user_id => 1,
        :name_on_card => "Name On Card",
        :card_last4 => "Card Last4",
        :card_exp_month => "Card Exp Month",
        :card_exp_year => "Card Exp Year",
        :status => "Status"
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name On Card".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Card Last4".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Card Exp Month".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Card Exp Year".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
