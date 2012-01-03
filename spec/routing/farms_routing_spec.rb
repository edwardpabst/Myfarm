require "spec_helper"

describe FarmsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/farms" }.should route_to(:controller => "farms", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/farms/new" }.should route_to(:controller => "farms", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/farms/1" }.should route_to(:controller => "farms", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/farms/1/edit" }.should route_to(:controller => "farms", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/farms" }.should route_to(:controller => "farms", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/farms/1" }.should route_to(:controller => "farms", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/farms/1" }.should route_to(:controller => "farms", :action => "destroy", :id => "1")
    end

  end
end
