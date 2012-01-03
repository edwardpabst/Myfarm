require "spec_helper"

describe FieldmappingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/fieldmappings" }.should route_to(:controller => "fieldmappings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fieldmappings/new" }.should route_to(:controller => "fieldmappings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fieldmappings/1" }.should route_to(:controller => "fieldmappings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fieldmappings/1/edit" }.should route_to(:controller => "fieldmappings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fieldmappings" }.should route_to(:controller => "fieldmappings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/fieldmappings/1" }.should route_to(:controller => "fieldmappings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fieldmappings/1" }.should route_to(:controller => "fieldmappings", :action => "destroy", :id => "1")
    end

  end
end
