require "spec_helper"

describe EquipmentController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/equipment" }.should route_to(:controller => "equipment", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/equipment/new" }.should route_to(:controller => "equipment", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/equipment/1" }.should route_to(:controller => "equipment", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/equipment/1/edit" }.should route_to(:controller => "equipment", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/equipment" }.should route_to(:controller => "equipment", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/equipment/1" }.should route_to(:controller => "equipment", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/equipment/1" }.should route_to(:controller => "equipment", :action => "destroy", :id => "1")
    end

  end
end
