require 'spec_helper'

describe "subscriptions/new.html.erb" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :user_id => 1,
      :name_on_card => "MyString",
      :card_last4 => "MyString",
      :card_exp_month => "MyString",
      :card_exp_year => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => subscriptions_path, :method => "post" do
      assert_select "input#subscription_user_id", :name => "subscription[user_id]"
      assert_select "input#subscription_name_on_card", :name => "subscription[name_on_card]"
      assert_select "input#subscription_card_last4", :name => "subscription[card_last4]"
      assert_select "input#subscription_card_exp_month", :name => "subscription[card_exp_month]"
      assert_select "input#subscription_card_exp_year", :name => "subscription[card_exp_year]"
      assert_select "input#subscription_status", :name => "subscription[status]"
    end
  end
end
