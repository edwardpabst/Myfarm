require "spec_helper"

describe FieldsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/fields" }.should route_to(:controller => "fields", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fields/new" }.should route_to(:controller => "fields", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fields/1" }.should route_to(:controller => "fields", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fields/1/edit" }.should route_to(:controller => "fields", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fields" }.should route_to(:controller => "fields", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/fields/1" }.should route_to(:controller => "fields", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fields/1" }.should route_to(:controller => "fields", :action => "destroy", :id => "1")
    end

  end
end
