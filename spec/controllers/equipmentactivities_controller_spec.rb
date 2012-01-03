require 'spec_helper'

describe EquipmentactivitiesController do

  def mock_equipmentactivity(stubs={})
    (@mock_equipmentactivity ||= mock_model(Equipmentactivity).as_null_object).tap do |equipmentactivity|
      equipmentactivity.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all equipmentactivities as @equipmentactivities" do
      Equipmentactivity.stub(:all) { [mock_equipmentactivity] }
      get :index
      assigns(:equipmentactivities).should eq([mock_equipmentactivity])
    end
  end

  describe "GET show" do
    it "assigns the requested equipmentactivity as @equipmentactivity" do
      Equipmentactivity.stub(:find).with("37") { mock_equipmentactivity }
      get :show, :id => "37"
      assigns(:equipmentactivity).should be(mock_equipmentactivity)
    end
  end

  describe "GET new" do
    it "assigns a new equipmentactivity as @equipmentactivity" do
      Equipmentactivity.stub(:new) { mock_equipmentactivity }
      get :new
      assigns(:equipmentactivity).should be(mock_equipmentactivity)
    end
  end

  describe "GET edit" do
    it "assigns the requested equipmentactivity as @equipmentactivity" do
      Equipmentactivity.stub(:find).with("37") { mock_equipmentactivity }
      get :edit, :id => "37"
      assigns(:equipmentactivity).should be(mock_equipmentactivity)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created equipmentactivity as @equipmentactivity" do
        Equipmentactivity.stub(:new).with({'these' => 'params'}) { mock_equipmentactivity(:save => true) }
        post :create, :equipmentactivity => {'these' => 'params'}
        assigns(:equipmentactivity).should be(mock_equipmentactivity)
      end

      it "redirects to the created equipmentactivity" do
        Equipmentactivity.stub(:new) { mock_equipmentactivity(:save => true) }
        post :create, :equipmentactivity => {}
        response.should redirect_to(equipmentactivity_url(mock_equipmentactivity))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved equipmentactivity as @equipmentactivity" do
        Equipmentactivity.stub(:new).with({'these' => 'params'}) { mock_equipmentactivity(:save => false) }
        post :create, :equipmentactivity => {'these' => 'params'}
        assigns(:equipmentactivity).should be(mock_equipmentactivity)
      end

      it "re-renders the 'new' template" do
        Equipmentactivity.stub(:new) { mock_equipmentactivity(:save => false) }
        post :create, :equipmentactivity => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested equipmentactivity" do
        Equipmentactivity.should_receive(:find).with("37") { mock_equipmentactivity }
        mock_equipmentactivity.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :equipmentactivity => {'these' => 'params'}
      end

      it "assigns the requested equipmentactivity as @equipmentactivity" do
        Equipmentactivity.stub(:find) { mock_equipmentactivity(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:equipmentactivity).should be(mock_equipmentactivity)
      end

      it "redirects to the equipmentactivity" do
        Equipmentactivity.stub(:find) { mock_equipmentactivity(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(equipmentactivity_url(mock_equipmentactivity))
      end
    end

    describe "with invalid params" do
      it "assigns the equipmentactivity as @equipmentactivity" do
        Equipmentactivity.stub(:find) { mock_equipmentactivity(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:equipmentactivity).should be(mock_equipmentactivity)
      end

      it "re-renders the 'edit' template" do
        Equipmentactivity.stub(:find) { mock_equipmentactivity(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested equipmentactivity" do
      Equipmentactivity.should_receive(:find).with("37") { mock_equipmentactivity }
      mock_equipmentactivity.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the equipmentactivities list" do
      Equipmentactivity.stub(:find) { mock_equipmentactivity }
      delete :destroy, :id => "1"
      response.should redirect_to(equipmentactivities_url)
    end
  end

end
