require 'spec_helper'

describe CapitalrecoveriesController do

  def mock_capitalrecovery(stubs={})
    (@mock_capitalrecovery ||= mock_model(Capitalrecovery).as_null_object).tap do |capitalrecovery|
      capitalrecovery.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all capitalrecoveries as @capitalrecoveries" do
      Capitalrecovery.stub(:all) { [mock_capitalrecovery] }
      get :index
      assigns(:capitalrecoveries).should eq([mock_capitalrecovery])
    end
  end

  describe "GET show" do
    it "assigns the requested capitalrecovery as @capitalrecovery" do
      Capitalrecovery.stub(:find).with("37") { mock_capitalrecovery }
      get :show, :id => "37"
      assigns(:capitalrecovery).should be(mock_capitalrecovery)
    end
  end

  describe "GET new" do
    it "assigns a new capitalrecovery as @capitalrecovery" do
      Capitalrecovery.stub(:new) { mock_capitalrecovery }
      get :new
      assigns(:capitalrecovery).should be(mock_capitalrecovery)
    end
  end

  describe "GET edit" do
    it "assigns the requested capitalrecovery as @capitalrecovery" do
      Capitalrecovery.stub(:find).with("37") { mock_capitalrecovery }
      get :edit, :id => "37"
      assigns(:capitalrecovery).should be(mock_capitalrecovery)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created capitalrecovery as @capitalrecovery" do
        Capitalrecovery.stub(:new).with({'these' => 'params'}) { mock_capitalrecovery(:save => true) }
        post :create, :capitalrecovery => {'these' => 'params'}
        assigns(:capitalrecovery).should be(mock_capitalrecovery)
      end

      it "redirects to the created capitalrecovery" do
        Capitalrecovery.stub(:new) { mock_capitalrecovery(:save => true) }
        post :create, :capitalrecovery => {}
        response.should redirect_to(capitalrecovery_url(mock_capitalrecovery))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved capitalrecovery as @capitalrecovery" do
        Capitalrecovery.stub(:new).with({'these' => 'params'}) { mock_capitalrecovery(:save => false) }
        post :create, :capitalrecovery => {'these' => 'params'}
        assigns(:capitalrecovery).should be(mock_capitalrecovery)
      end

      it "re-renders the 'new' template" do
        Capitalrecovery.stub(:new) { mock_capitalrecovery(:save => false) }
        post :create, :capitalrecovery => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested capitalrecovery" do
        Capitalrecovery.should_receive(:find).with("37") { mock_capitalrecovery }
        mock_capitalrecovery.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :capitalrecovery => {'these' => 'params'}
      end

      it "assigns the requested capitalrecovery as @capitalrecovery" do
        Capitalrecovery.stub(:find) { mock_capitalrecovery(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:capitalrecovery).should be(mock_capitalrecovery)
      end

      it "redirects to the capitalrecovery" do
        Capitalrecovery.stub(:find) { mock_capitalrecovery(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(capitalrecovery_url(mock_capitalrecovery))
      end
    end

    describe "with invalid params" do
      it "assigns the capitalrecovery as @capitalrecovery" do
        Capitalrecovery.stub(:find) { mock_capitalrecovery(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:capitalrecovery).should be(mock_capitalrecovery)
      end

      it "re-renders the 'edit' template" do
        Capitalrecovery.stub(:find) { mock_capitalrecovery(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested capitalrecovery" do
      Capitalrecovery.should_receive(:find).with("37") { mock_capitalrecovery }
      mock_capitalrecovery.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the capitalrecoveries list" do
      Capitalrecovery.stub(:find) { mock_capitalrecovery }
      delete :destroy, :id => "1"
      response.should redirect_to(capitalrecoveries_url)
    end
  end

end
