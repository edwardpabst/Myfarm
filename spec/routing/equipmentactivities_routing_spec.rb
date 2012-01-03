require "spec_helper"

describe EquipmentactivitiesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/equipmentactivities" }.should route_to(:controller => "equipmentactivities", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/equipmentactivities/new" }.should route_to(:controller => "equipmentactivities", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/equipmentactivities/1" }.should route_to(:controller => "equipmentactivities", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/equipmentactivities/1/edit" }.should route_to(:controller => "equipmentactivities", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/equipmentactivities" }.should route_to(:controller => "equipmentactivities", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/equipmentactivities/1" }.should route_to(:controller => "equipmentactivities", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/equipmentactivities/1" }.should route_to(:controller => "equipmentactivities", :action => "destroy", :id => "1")
    end

  end
end
