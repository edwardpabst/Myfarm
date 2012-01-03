require "spec_helper"

describe FieldtasksuppliesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/fieldtasksupplies" }.should route_to(:controller => "fieldtasksupplies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fieldtasksupplies/new" }.should route_to(:controller => "fieldtasksupplies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fieldtasksupplies/1" }.should route_to(:controller => "fieldtasksupplies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fieldtasksupplies/1/edit" }.should route_to(:controller => "fieldtasksupplies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fieldtasksupplies" }.should route_to(:controller => "fieldtasksupplies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/fieldtasksupplies/1" }.should route_to(:controller => "fieldtasksupplies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/fieldtasksupplies/1" }.should route_to(:controller => "fieldtasksupplies", :action => "destroy", :id => "1")
    end

  end
end
