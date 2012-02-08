require 'spec_helper'

describe InventoryticketsController do

  def mock_inventoryticket(stubs={})
    (@mock_inventoryticket ||= mock_model(Inventoryticket).as_null_object).tap do |inventoryticket|
      inventoryticket.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all inventorytickets as @inventorytickets" do
      Inventoryticket.stub(:all) { [mock_inventoryticket] }
      get :index
      assigns(:inventorytickets).should eq([mock_inventoryticket])
    end
  end

  describe "GET show" do
    it "assigns the requested inventoryticket as @inventoryticket" do
      Inventoryticket.stub(:find).with("37") { mock_inventoryticket }
      get :show, :id => "37"
      assigns(:inventoryticket).should be(mock_inventoryticket)
    end
  end

  describe "GET new" do
    it "assigns a new inventoryticket as @inventoryticket" do
      Inventoryticket.stub(:new) { mock_inventoryticket }
      get :new
      assigns(:inventoryticket).should be(mock_inventoryticket)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventoryticket as @inventoryticket" do
      Inventoryticket.stub(:find).with("37") { mock_inventoryticket }
      get :edit, :id => "37"
      assigns(:inventoryticket).should be(mock_inventoryticket)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created inventoryticket as @inventoryticket" do
        Inventoryticket.stub(:new).with({'these' => 'params'}) { mock_inventoryticket(:save => true) }
        post :create, :inventoryticket => {'these' => 'params'}
        assigns(:inventoryticket).should be(mock_inventoryticket)
      end

      it "redirects to the created inventoryticket" do
        Inventoryticket.stub(:new) { mock_inventoryticket(:save => true) }
        post :create, :inventoryticket => {}
        response.should redirect_to(inventoryticket_url(mock_inventoryticket))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inventoryticket as @inventoryticket" do
        Inventoryticket.stub(:new).with({'these' => 'params'}) { mock_inventoryticket(:save => false) }
        post :create, :inventoryticket => {'these' => 'params'}
        assigns(:inventoryticket).should be(mock_inventoryticket)
      end

      it "re-renders the 'new' template" do
        Inventoryticket.stub(:new) { mock_inventoryticket(:save => false) }
        post :create, :inventoryticket => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested inventoryticket" do
        Inventoryticket.should_receive(:find).with("37") { mock_inventoryticket }
        mock_inventoryticket.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventoryticket => {'these' => 'params'}
      end

      it "assigns the requested inventoryticket as @inventoryticket" do
        Inventoryticket.stub(:find) { mock_inventoryticket(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:inventoryticket).should be(mock_inventoryticket)
      end

      it "redirects to the inventoryticket" do
        Inventoryticket.stub(:find) { mock_inventoryticket(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(inventoryticket_url(mock_inventoryticket))
      end
    end

    describe "with invalid params" do
      it "assigns the inventoryticket as @inventoryticket" do
        Inventoryticket.stub(:find) { mock_inventoryticket(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:inventoryticket).should be(mock_inventoryticket)
      end

      it "re-renders the 'edit' template" do
        Inventoryticket.stub(:find) { mock_inventoryticket(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested inventoryticket" do
      Inventoryticket.should_receive(:find).with("37") { mock_inventoryticket }
      mock_inventoryticket.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the inventorytickets list" do
      Inventoryticket.stub(:find) { mock_inventoryticket }
      delete :destroy, :id => "1"
      response.should redirect_to(inventorytickets_url)
    end
  end

end
