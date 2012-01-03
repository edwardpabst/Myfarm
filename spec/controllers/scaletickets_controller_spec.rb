require 'spec_helper'

describe ScaleticketsController do

  def mock_scaleticket(stubs={})
    (@mock_scaleticket ||= mock_model(Scaleticket).as_null_object).tap do |scaleticket|
      scaleticket.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all scaletickets as @scaletickets" do
      Scaleticket.stub(:all) { [mock_scaleticket] }
      get :index
      assigns(:scaletickets).should eq([mock_scaleticket])
    end
  end

  describe "GET show" do
    it "assigns the requested scaleticket as @scaleticket" do
      Scaleticket.stub(:find).with("37") { mock_scaleticket }
      get :show, :id => "37"
      assigns(:scaleticket).should be(mock_scaleticket)
    end
  end

  describe "GET new" do
    it "assigns a new scaleticket as @scaleticket" do
      Scaleticket.stub(:new) { mock_scaleticket }
      get :new
      assigns(:scaleticket).should be(mock_scaleticket)
    end
  end

  describe "GET edit" do
    it "assigns the requested scaleticket as @scaleticket" do
      Scaleticket.stub(:find).with("37") { mock_scaleticket }
      get :edit, :id => "37"
      assigns(:scaleticket).should be(mock_scaleticket)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created scaleticket as @scaleticket" do
        Scaleticket.stub(:new).with({'these' => 'params'}) { mock_scaleticket(:save => true) }
        post :create, :scaleticket => {'these' => 'params'}
        assigns(:scaleticket).should be(mock_scaleticket)
      end

      it "redirects to the created scaleticket" do
        Scaleticket.stub(:new) { mock_scaleticket(:save => true) }
        post :create, :scaleticket => {}
        response.should redirect_to(scaleticket_url(mock_scaleticket))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved scaleticket as @scaleticket" do
        Scaleticket.stub(:new).with({'these' => 'params'}) { mock_scaleticket(:save => false) }
        post :create, :scaleticket => {'these' => 'params'}
        assigns(:scaleticket).should be(mock_scaleticket)
      end

      it "re-renders the 'new' template" do
        Scaleticket.stub(:new) { mock_scaleticket(:save => false) }
        post :create, :scaleticket => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested scaleticket" do
        Scaleticket.should_receive(:find).with("37") { mock_scaleticket }
        mock_scaleticket.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scaleticket => {'these' => 'params'}
      end

      it "assigns the requested scaleticket as @scaleticket" do
        Scaleticket.stub(:find) { mock_scaleticket(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:scaleticket).should be(mock_scaleticket)
      end

      it "redirects to the scaleticket" do
        Scaleticket.stub(:find) { mock_scaleticket(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(scaleticket_url(mock_scaleticket))
      end
    end

    describe "with invalid params" do
      it "assigns the scaleticket as @scaleticket" do
        Scaleticket.stub(:find) { mock_scaleticket(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:scaleticket).should be(mock_scaleticket)
      end

      it "re-renders the 'edit' template" do
        Scaleticket.stub(:find) { mock_scaleticket(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested scaleticket" do
      Scaleticket.should_receive(:find).with("37") { mock_scaleticket }
      mock_scaleticket.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the scaletickets list" do
      Scaleticket.stub(:find) { mock_scaleticket }
      delete :destroy, :id => "1"
      response.should redirect_to(scaletickets_url)
    end
  end

end
