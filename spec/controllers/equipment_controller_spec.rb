require 'spec_helper'

describe EquipmentController do

  def mock_equipment(stubs={})
    (@mock_equipment ||= mock_model(Equipment).as_null_object).tap do |equipment|
      equipment.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all equipment as @equipment" do
      Equipment.stub(:all) { [mock_equipment] }
      get :index
      assigns(:equipment).should eq([mock_equipment])
    end
  end

  describe "GET show" do
    it "assigns the requested equipment as @equipment" do
      Equipment.stub(:find).with("37") { mock_equipment }
      get :show, :id => "37"
      assigns(:equipment).should be(mock_equipment)
    end
  end

  describe "GET new" do
    it "assigns a new equipment as @equipment" do
      Equipment.stub(:new) { mock_equipment }
      get :new
      assigns(:equipment).should be(mock_equipment)
    end
  end

  describe "GET edit" do
    it "assigns the requested equipment as @equipment" do
      Equipment.stub(:find).with("37") { mock_equipment }
      get :edit, :id => "37"
      assigns(:equipment).should be(mock_equipment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created equipment as @equipment" do
        Equipment.stub(:new).with({'these' => 'params'}) { mock_equipment(:save => true) }
        post :create, :equipment => {'these' => 'params'}
        assigns(:equipment).should be(mock_equipment)
      end

      it "redirects to the created equipment" do
        Equipment.stub(:new) { mock_equipment(:save => true) }
        post :create, :equipment => {}
        response.should redirect_to(equipment_url(mock_equipment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved equipment as @equipment" do
        Equipment.stub(:new).with({'these' => 'params'}) { mock_equipment(:save => false) }
        post :create, :equipment => {'these' => 'params'}
        assigns(:equipment).should be(mock_equipment)
      end

      it "re-renders the 'new' template" do
        Equipment.stub(:new) { mock_equipment(:save => false) }
        post :create, :equipment => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested equipment" do
        Equipment.should_receive(:find).with("37") { mock_equipment }
        mock_equipment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :equipment => {'these' => 'params'}
      end

      it "assigns the requested equipment as @equipment" do
        Equipment.stub(:find) { mock_equipment(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:equipment).should be(mock_equipment)
      end

      it "redirects to the equipment" do
        Equipment.stub(:find) { mock_equipment(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(equipment_url(mock_equipment))
      end
    end

    describe "with invalid params" do
      it "assigns the equipment as @equipment" do
        Equipment.stub(:find) { mock_equipment(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:equipment).should be(mock_equipment)
      end

      it "re-renders the 'edit' template" do
        Equipment.stub(:find) { mock_equipment(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested equipment" do
      Equipment.should_receive(:find).with("37") { mock_equipment }
      mock_equipment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the equipment list" do
      Equipment.stub(:find) { mock_equipment }
      delete :destroy, :id => "1"
      response.should redirect_to(equipment_url)
    end
  end

end
