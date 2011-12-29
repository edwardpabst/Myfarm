require "spec_helper"

describe SuppliesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/supplies" }.should route_to(:controller => "supplies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/supplies/new" }.should route_to(:controller => "supplies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/supplies/1" }.should route_to(:controller => "supplies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/supplies/1/edit" }.should route_to(:controller => "supplies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/supplies" }.should route_to(:controller => "supplies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/supplies/1" }.should route_to(:controller => "supplies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/supplies/1" }.should route_to(:controller => "supplies", :action => "destroy", :id => "1")
    end

  end
end
