require "spec_helper"

describe PartytypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/partytypes" }.should route_to(:controller => "partytypes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/partytypes/new" }.should route_to(:controller => "partytypes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/partytypes/1" }.should route_to(:controller => "partytypes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/partytypes/1/edit" }.should route_to(:controller => "partytypes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/partytypes" }.should route_to(:controller => "partytypes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/partytypes/1" }.should route_to(:controller => "partytypes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/partytypes/1" }.should route_to(:controller => "partytypes", :action => "destroy", :id => "1")
    end

  end
end
