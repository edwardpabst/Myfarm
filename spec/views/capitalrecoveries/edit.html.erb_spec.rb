require 'spec_helper'

describe "capitalrecoveries/edit.html.erb" do
  before(:each) do
    @capitalrecovery = assign(:capitalrecovery, stub_model(Capitalrecovery,
      :new_record? => false,
      :recovery_year => 1,
      :interest_rate => 1,
      :recovery_factor => "9.99"
    ))
  end

  it "renders the edit capitalrecovery form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => capitalrecovery_path(@capitalrecovery), :method => "post" do
      assert_select "input#capitalrecovery_recovery_year", :name => "capitalrecovery[recovery_year]"
      assert_select "input#capitalrecovery_interest_rate", :name => "capitalrecovery[interest_rate]"
      assert_select "input#capitalrecovery_recovery_factor", :name => "capitalrecovery[recovery_factor]"
    end
  end
end
