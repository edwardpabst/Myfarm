require 'spec_helper'

describe SupplyinventoriesController do

  def mock_supplyinventory(stubs={})
    (@mock_supplyinventory ||= mock_model(Supplyinventory).as_null_object).tap do |supplyinventory|
      supplyinventory.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all supplyinventories as @supplyinventories" do
      Supplyinventory.stub(:all) { [mock_supplyinventory] }
      get :index
      assigns(:supplyinventories).should eq([mock_supplyinventory])
    end
  end

  describe "GET show" do
    it "assigns the requested supplyinventory as @supplyinventory" do
      Supplyinventory.stub(:find).with("37") { mock_supplyinventory }
      get :show, :id => "37"
      assigns(:supplyinventory).should be(mock_supplyinventory)
    end
  end

  describe "GET new" do
    it "assigns a new supplyinventory as @supplyinventory" do
      Supplyinventory.stub(:new) { mock_supplyinventory }
      get :new
      assigns(:supplyinventory).should be(mock_supplyinventory)
    end
  end

  describe "GET edit" do
    it "assigns the requested supplyinventory as @supplyinventory" do
      Supplyinventory.stub(:find).with("37") { mock_supplyinventory }
      get :edit, :id => "37"
      assigns(:supplyinventory).should be(mock_supplyinventory)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created supplyinventory as @supplyinventory" do
        Supplyinventory.stub(:new).with({'these' => 'params'}) { mock_supplyinventory(:save => true) }
        post :create, :supplyinventory => {'these' => 'params'}
        assigns(:supplyinventory).should be(mock_supplyinventory)
      end

      it "redirects to the created supplyinventory" do
        Supplyinventory.stub(:new) { mock_supplyinventory(:save => true) }
        post :create, :supplyinventory => {}
        response.should redirect_to(supplyinventory_url(mock_supplyinventory))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved supplyinventory as @supplyinventory" do
        Supplyinventory.stub(:new).with({'these' => 'params'}) { mock_supplyinventory(:save => false) }
        post :create, :supplyinventory => {'these' => 'params'}
        assigns(:supplyinventory).should be(mock_supplyinventory)
      end

      it "re-renders the 'new' template" do
        Supplyinventory.stub(:new) { mock_supplyinventory(:save => false) }
        post :create, :supplyinventory => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested supplyinventory" do
        Supplyinventory.should_receive(:find).with("37") { mock_supplyinventory }
        mock_supplyinventory.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :supplyinventory => {'these' => 'params'}
      end

      it "assigns the requested supplyinventory as @supplyinventory" do
        Supplyinventory.stub(:find) { mock_supplyinventory(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:supplyinventory).should be(mock_supplyinventory)
      end

      it "redirects to the supplyinventory" do
        Supplyinventory.stub(:find) { mock_supplyinventory(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(supplyinventory_url(mock_supplyinventory))
      end
    end

    describe "with invalid params" do
      it "assigns the supplyinventory as @supplyinventory" do
        Supplyinventory.stub(:find) { mock_supplyinventory(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:supplyinventory).should be(mock_supplyinventory)
      end

      it "re-renders the 'edit' template" do
        Supplyinventory.stub(:find) { mock_supplyinventory(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested supplyinventory" do
      Supplyinventory.should_receive(:find).with("37") { mock_supplyinventory }
      mock_supplyinventory.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the supplyinventories list" do
      Supplyinventory.stub(:find) { mock_supplyinventory }
      delete :destroy, :id => "1"
      response.should redirect_to(supplyinventories_url)
    end
  end

end
