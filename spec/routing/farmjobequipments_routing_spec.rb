require "spec_helper"

describe FarmjobequipmentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/farmjobequipments" }.should route_to(:controller => "farmjobequipments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/farmjobequipments/new" }.should route_to(:controller => "farmjobequipments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/farmjobequipments/1" }.should route_to(:controller => "farmjobequipments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/farmjobequipments/1/edit" }.should route_to(:controller => "farmjobequipments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/farmjobequipments" }.should route_to(:controller => "farmjobequipments", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/farmjobequipments/1" }.should route_to(:controller => "farmjobequipments", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/farmjobequipments/1" }.should route_to(:controller => "farmjobequipments", :action => "destroy", :id => "1")
    end

  end
end
