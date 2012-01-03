require 'spec_helper'

describe FarmjobsuppliesController do

  def mock_farmjobsupply(stubs={})
    (@mock_farmjobsupply ||= mock_model(Farmjobsupply).as_null_object).tap do |farmjobsupply|
      farmjobsupply.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all farmjobsupplies as @farmjobsupplies" do
      Farmjobsupply.stub(:all) { [mock_farmjobsupply] }
      get :index
      assigns(:farmjobsupplies).should eq([mock_farmjobsupply])
    end
  end

  describe "GET show" do
    it "assigns the requested farmjobsupply as @farmjobsupply" do
      Farmjobsupply.stub(:find).with("37") { mock_farmjobsupply }
      get :show, :id => "37"
      assigns(:farmjobsupply).should be(mock_farmjobsupply)
    end
  end

  describe "GET new" do
    it "assigns a new farmjobsupply as @farmjobsupply" do
      Farmjobsupply.stub(:new) { mock_farmjobsupply }
      get :new
      assigns(:farmjobsupply).should be(mock_farmjobsupply)
    end
  end

  describe "GET edit" do
    it "assigns the requested farmjobsupply as @farmjobsupply" do
      Farmjobsupply.stub(:find).with("37") { mock_farmjobsupply }
      get :edit, :id => "37"
      assigns(:farmjobsupply).should be(mock_farmjobsupply)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created farmjobsupply as @farmjobsupply" do
        Farmjobsupply.stub(:new).with({'these' => 'params'}) { mock_farmjobsupply(:save => true) }
        post :create, :farmjobsupply => {'these' => 'params'}
        assigns(:farmjobsupply).should be(mock_farmjobsupply)
      end

      it "redirects to the created farmjobsupply" do
        Farmjobsupply.stub(:new) { mock_farmjobsupply(:save => true) }
        post :create, :farmjobsupply => {}
        response.should redirect_to(farmjobsupply_url(mock_farmjobsupply))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved farmjobsupply as @farmjobsupply" do
        Farmjobsupply.stub(:new).with({'these' => 'params'}) { mock_farmjobsupply(:save => false) }
        post :create, :farmjobsupply => {'these' => 'params'}
        assigns(:farmjobsupply).should be(mock_farmjobsupply)
      end

      it "re-renders the 'new' template" do
        Farmjobsupply.stub(:new) { mock_farmjobsupply(:save => false) }
        post :create, :farmjobsupply => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested farmjobsupply" do
        Farmjobsupply.should_receive(:find).with("37") { mock_farmjobsupply }
        mock_farmjobsupply.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :farmjobsupply => {'these' => 'params'}
      end

      it "assigns the requested farmjobsupply as @farmjobsupply" do
        Farmjobsupply.stub(:find) { mock_farmjobsupply(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:farmjobsupply).should be(mock_farmjobsupply)
      end

      it "redirects to the farmjobsupply" do
        Farmjobsupply.stub(:find) { mock_farmjobsupply(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(farmjobsupply_url(mock_farmjobsupply))
      end
    end

    describe "with invalid params" do
      it "assigns the farmjobsupply as @farmjobsupply" do
        Farmjobsupply.stub(:find) { mock_farmjobsupply(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:farmjobsupply).should be(mock_farmjobsupply)
      end

      it "re-renders the 'edit' template" do
        Farmjobsupply.stub(:find) { mock_farmjobsupply(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested farmjobsupply" do
      Farmjobsupply.should_receive(:find).with("37") { mock_farmjobsupply }
      mock_farmjobsupply.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the farmjobsupplies list" do
      Farmjobsupply.stub(:find) { mock_farmjobsupply }
      delete :destroy, :id => "1"
      response.should redirect_to(farmjobsupplies_url)
    end
  end

end
