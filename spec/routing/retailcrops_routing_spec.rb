require "spec_helper"

describe RetailcropsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/retailcrops" }.should route_to(:controller => "retailcrops", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/retailcrops/new" }.should route_to(:controller => "retailcrops", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/retailcrops/1" }.should route_to(:controller => "retailcrops", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/retailcrops/1/edit" }.should route_to(:controller => "retailcrops", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/retailcrops" }.should route_to(:controller => "retailcrops", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/retailcrops/1" }.should route_to(:controller => "retailcrops", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/retailcrops/1" }.should route_to(:controller => "retailcrops", :action => "destroy", :id => "1")
    end

  end
end
