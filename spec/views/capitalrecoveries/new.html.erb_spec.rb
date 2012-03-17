require 'spec_helper'

describe "capitalrecoveries/new.html.erb" do
  before(:each) do
    assign(:capitalrecovery, stub_model(Capitalrecovery,
      :recovery_year => 1,
      :interest_rate => 1,
      :recovery_factor => "9.99"
    ).as_new_record)
  end

  it "renders new capitalrecovery form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => capitalrecoveries_path, :method => "post" do
      assert_select "input#capitalrecovery_recovery_year", :name => "capitalrecovery[recovery_year]"
      assert_select "input#capitalrecovery_interest_rate", :name => "capitalrecovery[interest_rate]"
      assert_select "input#capitalrecovery_recovery_factor", :name => "capitalrecovery[recovery_factor]"
    end
  end
end
