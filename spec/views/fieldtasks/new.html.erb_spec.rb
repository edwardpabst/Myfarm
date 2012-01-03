require 'spec_helper'

describe "fieldtasks/new.html.erb" do
  before(:each) do
    assign(:fieldtask, stub_model(Fieldtask,
      :user_id => 1,
      :task_type => "MyString",
      :taskdescription => "MyString",
      :task_notes => "MyString",
      :task_frequency_weeks => 1,
      :task_frequency_days => 1
    ).as_new_record)
  end

  it "renders new fieldtask form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => fieldtasks_path, :method => "post" do
      assert_select "input#fieldtask_user_id", :name => "fieldtask[user_id]"
      assert_select "input#fieldtask_task_type", :name => "fieldtask[task_type]"
      assert_select "input#fieldtask_taskdescription", :name => "fieldtask[taskdescription]"
      assert_select "input#fieldtask_task_notes", :name => "fieldtask[task_notes]"
      assert_select "input#fieldtask_task_frequency_weeks", :name => "fieldtask[task_frequency_weeks]"
      assert_select "input#fieldtask_task_frequency_days", :name => "fieldtask[task_frequency_days]"
    end
  end
end
