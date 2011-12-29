require "spec_helper"

describe FieldtasksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/fieldtasks" }.should route_to(:controller => "fieldtasks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fieldtasks/new" }.should route_to(:controller => "fieldtasks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fieldtasks/1" }.should route_to(:controller => "fieldtasks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fieldtasks/1/edit" }.should route_to(:controller => "fieldtasks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fieldtasks" }.should route_to(:controller => "fieldtasks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/fieldtasks/1" }.should route_to(:controller => "fieldtasks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fieldtasks/1" }.should route_to(:controller => "fieldtasks", :action => "destroy", :id => "1")
    end

  end
end
