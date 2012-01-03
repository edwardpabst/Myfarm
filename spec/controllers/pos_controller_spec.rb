require 'spec_helper'

describe PosController do

  def mock_po(stubs={})
    (@mock_po ||= mock_model(Po).as_null_object).tap do |po|
      po.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all pos as @pos" do
      Po.stub(:all) { [mock_po] }
      get :index
      assigns(:pos).should eq([mock_po])
    end
  end

  describe "GET show" do
    it "assigns the requested po as @po" do
      Po.stub(:find).with("37") { mock_po }
      get :show, :id => "37"
      assigns(:po).should be(mock_po)
    end
  end

  describe "GET new" do
    it "assigns a new po as @po" do
      Po.stub(:new) { mock_po }
      get :new
      assigns(:po).should be(mock_po)
    end
  end

  describe "GET edit" do
    it "assigns the requested po as @po" do
      Po.stub(:find).with("37") { mock_po }
      get :edit, :id => "37"
      assigns(:po).should be(mock_po)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created po as @po" do
        Po.stub(:new).with({'these' => 'params'}) { mock_po(:save => true) }
        post :create, :po => {'these' => 'params'}
        assigns(:po).should be(mock_po)
      end

      it "redirects to the created po" do
        Po.stub(:new) { mock_po(:save => true) }
        post :create, :po => {}
        response.should redirect_to(po_url(mock_po))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved po as @po" do
        Po.stub(:new).with({'these' => 'params'}) { mock_po(:save => false) }
        post :create, :po => {'these' => 'params'}
        assigns(:po).should be(mock_po)
      end

      it "re-renders the 'new' template" do
        Po.stub(:new) { mock_po(:save => false) }
        post :create, :po => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested po" do
        Po.should_receive(:find).with("37") { mock_po }
        mock_po.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :po => {'these' => 'params'}
      end

      it "assigns the requested po as @po" do
        Po.stub(:find) { mock_po(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:po).should be(mock_po)
      end

      it "redirects to the po" do
        Po.stub(:find) { mock_po(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(po_url(mock_po))
      end
    end

    describe "with invalid params" do
      it "assigns the po as @po" do
        Po.stub(:find) { mock_po(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:po).should be(mock_po)
      end

      it "re-renders the 'edit' template" do
        Po.stub(:find) { mock_po(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested po" do
      Po.should_receive(:find).with("37") { mock_po }
      mock_po.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pos list" do
      Po.stub(:find) { mock_po }
      delete :destroy, :id => "1"
      response.should redirect_to(pos_url)
    end
  end

end
