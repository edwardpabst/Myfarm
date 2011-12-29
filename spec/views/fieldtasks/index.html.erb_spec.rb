require 'spec_helper'

describe "fieldtasks/index.html.erb" do
  before(:each) do
    assign(:fieldtasks, [
      stub_model(Fieldtask,
        :user_id => 1,
        :task_type => "Task Type",
        :taskdescription => "Taskdescription",
        :task_notes => "Task Notes",
        :task_frequency_weeks => 1,
        :task_frequency_days => 1
      ),
      stub_model(Fieldtask,
        :user_id => 1,
        :task_type => "Task Type",
        :taskdescription => "Taskdescription",
        :task_notes => "Task Notes",
        :task_frequency_weeks => 1,
        :task_frequency_days => 1
      )
    ])
  end

  it "renders a list of fieldtasks" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Task Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Taskdescription".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Task Notes".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
