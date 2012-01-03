require "spec_helper"

describe FarmexpensesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/farmexpenses" }.should route_to(:controller => "farmexpenses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/farmexpenses/new" }.should route_to(:controller => "farmexpenses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/farmexpenses/1" }.should route_to(:controller => "farmexpenses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/farmexpenses/1/edit" }.should route_to(:controller => "farmexpenses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/farmexpenses" }.should route_to(:controller => "farmexpenses", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/farmexpenses/1" }.should route_to(:controller => "farmexpenses", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/farmexpenses/1" }.should route_to(:controller => "farmexpenses", :action => "destroy", :id => "1")
    end

  end
end
