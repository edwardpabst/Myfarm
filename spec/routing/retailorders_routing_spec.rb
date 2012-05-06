require "spec_helper"

describe RetailordersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/retailorders" }.should route_to(:controller => "retailorders", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/retailorders/new" }.should route_to(:controller => "retailorders", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/retailorders/1" }.should route_to(:controller => "retailorders", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/retailorders/1/edit" }.should route_to(:controller => "retailorders", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/retailorders" }.should route_to(:controller => "retailorders", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/retailorders/1" }.should route_to(:controller => "retailorders", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/retailorders/1" }.should route_to(:controller => "retailorders", :action => "destroy", :id => "1")
    end

  end
end
