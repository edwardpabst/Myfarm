require 'spec_helper'

describe SuppliesController do

  def mock_supply(stubs={})
    (@mock_supply ||= mock_model(Supply).as_null_object).tap do |supply|
      supply.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all supplies as @supplies" do
      Supply.stub(:all) { [mock_supply] }
      get :index
      assigns(:supplies).should eq([mock_supply])
    end
  end

  describe "GET show" do
    it "assigns the requested supply as @supply" do
      Supply.stub(:find).with("37") { mock_supply }
      get :show, :id => "37"
      assigns(:supply).should be(mock_supply)
    end
  end

  describe "GET new" do
    it "assigns a new supply as @supply" do
      Supply.stub(:new) { mock_supply }
      get :new
      assigns(:supply).should be(mock_supply)
    end
  end

  describe "GET edit" do
    it "assigns the requested supply as @supply" do
      Supply.stub(:find).with("37") { mock_supply }
      get :edit, :id => "37"
      assigns(:supply).should be(mock_supply)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created supply as @supply" do
        Supply.stub(:new).with({'these' => 'params'}) { mock_supply(:save => true) }
        post :create, :supply => {'these' => 'params'}
        assigns(:supply).should be(mock_supply)
      end

      it "redirects to the created supply" do
        Supply.stub(:new) { mock_supply(:save => true) }
        post :create, :supply => {}
        response.should redirect_to(supply_url(mock_supply))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved supply as @supply" do
        Supply.stub(:new).with({'these' => 'params'}) { mock_supply(:save => false) }
        post :create, :supply => {'these' => 'params'}
        assigns(:supply).should be(mock_supply)
      end

      it "re-renders the 'new' template" do
        Supply.stub(:new) { mock_supply(:save => false) }
        post :create, :supply => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested supply" do
        Supply.should_receive(:find).with("37") { mock_supply }
        mock_supply.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :supply => {'these' => 'params'}
      end

      it "assigns the requested supply as @supply" do
        Supply.stub(:find) { mock_supply(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:supply).should be(mock_supply)
      end

      it "redirects to the supply" do
        Supply.stub(:find) { mock_supply(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(supply_url(mock_supply))
      end
    end

    describe "with invalid params" do
      it "assigns the supply as @supply" do
        Supply.stub(:find) { mock_supply(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:supply).should be(mock_supply)
      end

      it "re-renders the 'edit' template" do
        Supply.stub(:find) { mock_supply(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested supply" do
      Supply.should_receive(:find).with("37") { mock_supply }
      mock_supply.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the supplies list" do
      Supply.stub(:find) { mock_supply }
      delete :destroy, :id => "1"
      response.should redirect_to(supplies_url)
    end
  end

end
