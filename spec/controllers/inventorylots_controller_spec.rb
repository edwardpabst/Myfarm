require 'spec_helper'

describe InventorylotsController do

  def mock_inventorylot(stubs={})
    (@mock_inventorylot ||= mock_model(Inventorylot).as_null_object).tap do |inventorylot|
      inventorylot.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all inventorylots as @inventorylots" do
      Inventorylot.stub(:all) { [mock_inventorylot] }
      get :index
      assigns(:inventorylots).should eq([mock_inventorylot])
    end
  end

  describe "GET show" do
    it "assigns the requested inventorylot as @inventorylot" do
      Inventorylot.stub(:find).with("37") { mock_inventorylot }
      get :show, :id => "37"
      assigns(:inventorylot).should be(mock_inventorylot)
    end
  end

  describe "GET new" do
    it "assigns a new inventorylot as @inventorylot" do
      Inventorylot.stub(:new) { mock_inventorylot }
      get :new
      assigns(:inventorylot).should be(mock_inventorylot)
    end
  end

  describe "GET edit" do
    it "assigns the requested inventorylot as @inventorylot" do
      Inventorylot.stub(:find).with("37") { mock_inventorylot }
      get :edit, :id => "37"
      assigns(:inventorylot).should be(mock_inventorylot)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created inventorylot as @inventorylot" do
        Inventorylot.stub(:new).with({'these' => 'params'}) { mock_inventorylot(:save => true) }
        post :create, :inventorylot => {'these' => 'params'}
        assigns(:inventorylot).should be(mock_inventorylot)
      end

      it "redirects to the created inventorylot" do
        Inventorylot.stub(:new) { mock_inventorylot(:save => true) }
        post :create, :inventorylot => {}
        response.should redirect_to(inventorylot_url(mock_inventorylot))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inventorylot as @inventorylot" do
        Inventorylot.stub(:new).with({'these' => 'params'}) { mock_inventorylot(:save => false) }
        post :create, :inventorylot => {'these' => 'params'}
        assigns(:inventorylot).should be(mock_inventorylot)
      end

      it "re-renders the 'new' template" do
        Inventorylot.stub(:new) { mock_inventorylot(:save => false) }
        post :create, :inventorylot => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested inventorylot" do
        Inventorylot.should_receive(:find).with("37") { mock_inventorylot }
        mock_inventorylot.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inventorylot => {'these' => 'params'}
      end

      it "assigns the requested inventorylot as @inventorylot" do
        Inventorylot.stub(:find) { mock_inventorylot(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:inventorylot).should be(mock_inventorylot)
      end

      it "redirects to the inventorylot" do
        Inventorylot.stub(:find) { mock_inventorylot(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(inventorylot_url(mock_inventorylot))
      end
    end

    describe "with invalid params" do
      it "assigns the inventorylot as @inventorylot" do
        Inventorylot.stub(:find) { mock_inventorylot(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:inventorylot).should be(mock_inventorylot)
      end

      it "re-renders the 'edit' template" do
        Inventorylot.stub(:find) { mock_inventorylot(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested inventorylot" do
      Inventorylot.should_receive(:find).with("37") { mock_inventorylot }
      mock_inventorylot.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the inventorylots list" do
      Inventorylot.stub(:find) { mock_inventorylot }
      delete :destroy, :id => "1"
      response.should redirect_to(inventorylots_url)
    end
  end

end
