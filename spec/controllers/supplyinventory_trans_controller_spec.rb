require 'spec_helper'

describe SupplyinventoryTransController do

  def mock_supplyinventory_tran(stubs={})
    (@mock_supplyinventory_tran ||= mock_model(SupplyinventoryTran).as_null_object).tap do |supplyinventory_tran|
      supplyinventory_tran.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all supplyinventory_trans as @supplyinventory_trans" do
      SupplyinventoryTran.stub(:all) { [mock_supplyinventory_tran] }
      get :index
      assigns(:supplyinventory_trans).should eq([mock_supplyinventory_tran])
    end
  end

  describe "GET show" do
    it "assigns the requested supplyinventory_tran as @supplyinventory_tran" do
      SupplyinventoryTran.stub(:find).with("37") { mock_supplyinventory_tran }
      get :show, :id => "37"
      assigns(:supplyinventory_tran).should be(mock_supplyinventory_tran)
    end
  end

  describe "GET new" do
    it "assigns a new supplyinventory_tran as @supplyinventory_tran" do
      SupplyinventoryTran.stub(:new) { mock_supplyinventory_tran }
      get :new
      assigns(:supplyinventory_tran).should be(mock_supplyinventory_tran)
    end
  end

  describe "GET edit" do
    it "assigns the requested supplyinventory_tran as @supplyinventory_tran" do
      SupplyinventoryTran.stub(:find).with("37") { mock_supplyinventory_tran }
      get :edit, :id => "37"
      assigns(:supplyinventory_tran).should be(mock_supplyinventory_tran)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created supplyinventory_tran as @supplyinventory_tran" do
        SupplyinventoryTran.stub(:new).with({'these' => 'params'}) { mock_supplyinventory_tran(:save => true) }
        post :create, :supplyinventory_tran => {'these' => 'params'}
        assigns(:supplyinventory_tran).should be(mock_supplyinventory_tran)
      end

      it "redirects to the created supplyinventory_tran" do
        SupplyinventoryTran.stub(:new) { mock_supplyinventory_tran(:save => true) }
        post :create, :supplyinventory_tran => {}
        response.should redirect_to(supplyinventory_tran_url(mock_supplyinventory_tran))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved supplyinventory_tran as @supplyinventory_tran" do
        SupplyinventoryTran.stub(:new).with({'these' => 'params'}) { mock_supplyinventory_tran(:save => false) }
        post :create, :supplyinventory_tran => {'these' => 'params'}
        assigns(:supplyinventory_tran).should be(mock_supplyinventory_tran)
      end

      it "re-renders the 'new' template" do
        SupplyinventoryTran.stub(:new) { mock_supplyinventory_tran(:save => false) }
        post :create, :supplyinventory_tran => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested supplyinventory_tran" do
        SupplyinventoryTran.should_receive(:find).with("37") { mock_supplyinventory_tran }
        mock_supplyinventory_tran.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :supplyinventory_tran => {'these' => 'params'}
      end

      it "assigns the requested supplyinventory_tran as @supplyinventory_tran" do
        SupplyinventoryTran.stub(:find) { mock_supplyinventory_tran(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:supplyinventory_tran).should be(mock_supplyinventory_tran)
      end

      it "redirects to the supplyinventory_tran" do
        SupplyinventoryTran.stub(:find) { mock_supplyinventory_tran(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(supplyinventory_tran_url(mock_supplyinventory_tran))
      end
    end

    describe "with invalid params" do
      it "assigns the supplyinventory_tran as @supplyinventory_tran" do
        SupplyinventoryTran.stub(:find) { mock_supplyinventory_tran(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:supplyinventory_tran).should be(mock_supplyinventory_tran)
      end

      it "re-renders the 'edit' template" do
        SupplyinventoryTran.stub(:find) { mock_supplyinventory_tran(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested supplyinventory_tran" do
      SupplyinventoryTran.should_receive(:find).with("37") { mock_supplyinventory_tran }
      mock_supplyinventory_tran.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the supplyinventory_trans list" do
      SupplyinventoryTran.stub(:find) { mock_supplyinventory_tran }
      delete :destroy, :id => "1"
      response.should redirect_to(supplyinventory_trans_url)
    end
  end

end
