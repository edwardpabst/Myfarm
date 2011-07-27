require "spec_helper"

describe PartyrolesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/partyroles" }.should route_to(:controller => "partyroles", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/partyroles/new" }.should route_to(:controller => "partyroles", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/partyroles/1" }.should route_to(:controller => "partyroles", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/partyroles/1/edit" }.should route_to(:controller => "partyroles", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/partyroles" }.should route_to(:controller => "partyroles", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/partyroles/1" }.should route_to(:controller => "partyroles", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/partyroles/1" }.should route_to(:controller => "partyroles", :action => "destroy", :id => "1")
    end

  end
end
