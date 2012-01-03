require "spec_helper"

describe CropsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/crops" }.should route_to(:controller => "crops", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/crops/new" }.should route_to(:controller => "crops", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/crops/1" }.should route_to(:controller => "crops", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/crops/1/edit" }.should route_to(:controller => "crops", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/crops" }.should route_to(:controller => "crops", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/crops/1" }.should route_to(:controller => "crops", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/crops/1" }.should route_to(:controller => "crops", :action => "destroy", :id => "1")
    end

  end
end
