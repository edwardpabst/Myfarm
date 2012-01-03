require 'spec_helper'

describe FieldsController do

  def mock_field(stubs={})
    (@mock_field ||= mock_model(Field).as_null_object).tap do |field|
      field.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all fields as @fields" do
      Field.stub(:all) { [mock_field] }
      get :index
      assigns(:fields).should eq([mock_field])
    end
  end

  describe "GET show" do
    it "assigns the requested field as @field" do
      Field.stub(:find).with("37") { mock_field }
      get :show, :id => "37"
      assigns(:field).should be(mock_field)
    end
  end

  describe "GET new" do
    it "assigns a new field as @field" do
      Field.stub(:new) { mock_field }
      get :new
      assigns(:field).should be(mock_field)
    end
  end

  describe "GET edit" do
    it "assigns the requested field as @field" do
      Field.stub(:find).with("37") { mock_field }
      get :edit, :id => "37"
      assigns(:field).should be(mock_field)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created field as @field" do
        Field.stub(:new).with({'these' => 'params'}) { mock_field(:save => true) }
        post :create, :field => {'these' => 'params'}
        assigns(:field).should be(mock_field)
      end

      it "redirects to the created field" do
        Field.stub(:new) { mock_field(:save => true) }
        post :create, :field => {}
        response.should redirect_to(field_url(mock_field))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved field as @field" do
        Field.stub(:new).with({'these' => 'params'}) { mock_field(:save => false) }
        post :create, :field => {'these' => 'params'}
        assigns(:field).should be(mock_field)
      end

      it "re-renders the 'new' template" do
        Field.stub(:new) { mock_field(:save => false) }
        post :create, :field => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested field" do
        Field.should_receive(:find).with("37") { mock_field }
        mock_field.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :field => {'these' => 'params'}
      end

      it "assigns the requested field as @field" do
        Field.stub(:find) { mock_field(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:field).should be(mock_field)
      end

      it "redirects to the field" do
        Field.stub(:find) { mock_field(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(field_url(mock_field))
      end
    end

    describe "with invalid params" do
      it "assigns the field as @field" do
        Field.stub(:find) { mock_field(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:field).should be(mock_field)
      end

      it "re-renders the 'edit' template" do
        Field.stub(:find) { mock_field(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested field" do
      Field.should_receive(:find).with("37") { mock_field }
      mock_field.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fields list" do
      Field.stub(:find) { mock_field }
      delete :destroy, :id => "1"
      response.should redirect_to(fields_url)
    end
  end

end
