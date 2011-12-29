require 'spec_helper'

describe FieldtasksuppliesController do

  def mock_fieldtasksupply(stubs={})
    (@mock_fieldtasksupply ||= mock_model(Fieldtasksupply).as_null_object).tap do |fieldtasksupply|
      fieldtasksupply.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all fieldtasksupplies as @fieldtasksupplies" do
      Fieldtasksupply.stub(:all) { [mock_fieldtasksupply] }
      get :index
      assigns(:fieldtasksupplies).should eq([mock_fieldtasksupply])
    end
  end

  describe "GET show" do
    it "assigns the requested fieldtasksupply as @fieldtasksupply" do
      Fieldtasksupply.stub(:find).with("37") { mock_fieldtasksupply }
      get :show, :id => "37"
      assigns(:fieldtasksupply).should be(mock_fieldtasksupply)
    end
  end

  describe "GET new" do
    it "assigns a new fieldtasksupply as @fieldtasksupply" do
      Fieldtasksupply.stub(:new) { mock_fieldtasksupply }
      get :new
      assigns(:fieldtasksupply).should be(mock_fieldtasksupply)
    end
  end

  describe "GET edit" do
    it "assigns the requested fieldtasksupply as @fieldtasksupply" do
      Fieldtasksupply.stub(:find).with("37") { mock_fieldtasksupply }
      get :edit, :id => "37"
      assigns(:fieldtasksupply).should be(mock_fieldtasksupply)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fieldtasksupply as @fieldtasksupply" do
        Fieldtasksupply.stub(:new).with({'these' => 'params'}) { mock_fieldtasksupply(:save => true) }
        post :create, :fieldtasksupply => {'these' => 'params'}
        assigns(:fieldtasksupply).should be(mock_fieldtasksupply)
      end

      it "redirects to the created fieldtasksupply" do
        Fieldtasksupply.stub(:new) { mock_fieldtasksupply(:save => true) }
        post :create, :fieldtasksupply => {}
        response.should redirect_to(fieldtasksupply_url(mock_fieldtasksupply))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fieldtasksupply as @fieldtasksupply" do
        Fieldtasksupply.stub(:new).with({'these' => 'params'}) { mock_fieldtasksupply(:save => false) }
        post :create, :fieldtasksupply => {'these' => 'params'}
        assigns(:fieldtasksupply).should be(mock_fieldtasksupply)
      end

      it "re-renders the 'new' template" do
        Fieldtasksupply.stub(:new) { mock_fieldtasksupply(:save => false) }
        post :create, :fieldtasksupply => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fieldtasksupply" do
        Fieldtasksupply.should_receive(:find).with("37") { mock_fieldtasksupply }
        mock_fieldtasksupply.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fieldtasksupply => {'these' => 'params'}
      end

      it "assigns the requested fieldtasksupply as @fieldtasksupply" do
        Fieldtasksupply.stub(:find) { mock_fieldtasksupply(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:fieldtasksupply).should be(mock_fieldtasksupply)
      end

      it "redirects to the fieldtasksupply" do
        Fieldtasksupply.stub(:find) { mock_fieldtasksupply(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(fieldtasksupply_url(mock_fieldtasksupply))
      end
    end

    describe "with invalid params" do
      it "assigns the fieldtasksupply as @fieldtasksupply" do
        Fieldtasksupply.stub(:find) { mock_fieldtasksupply(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:fieldtasksupply).should be(mock_fieldtasksupply)
      end

      it "re-renders the 'edit' template" do
        Fieldtasksupply.stub(:find) { mock_fieldtasksupply(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fieldtasksupply" do
      Fieldtasksupply.should_receive(:find).with("37") { mock_fieldtasksupply }
      mock_fieldtasksupply.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fieldtasksupplies list" do
      Fieldtasksupply.stub(:find) { mock_fieldtasksupply }
      delete :destroy, :id => "1"
      response.should redirect_to(fieldtasksupplies_url)
    end
  end

end
