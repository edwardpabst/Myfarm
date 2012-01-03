require "spec_helper"

describe HarvestsourcesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/harvestsources" }.should route_to(:controller => "harvestsources", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/harvestsources/new" }.should route_to(:controller => "harvestsources", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/harvestsources/1" }.should route_to(:controller => "harvestsources", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/harvestsources/1/edit" }.should route_to(:controller => "harvestsources", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/harvestsources" }.should route_to(:controller => "harvestsources", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/harvestsources/1" }.should route_to(:controller => "harvestsources", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/harvestsources/1" }.should route_to(:controller => "harvestsources", :action => "destroy", :id => "1")
    end

  end
end
