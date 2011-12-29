require 'spec_helper'

describe FieldmappingsController do

  def mock_fieldmapping(stubs={})
    (@mock_fieldmapping ||= mock_model(Fieldmapping).as_null_object).tap do |fieldmapping|
      fieldmapping.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all fieldmappings as @fieldmappings" do
      Fieldmapping.stub(:all) { [mock_fieldmapping] }
      get :index
      assigns(:fieldmappings).should eq([mock_fieldmapping])
    end
  end

  describe "GET show" do
    it "assigns the requested fieldmapping as @fieldmapping" do
      Fieldmapping.stub(:find).with("37") { mock_fieldmapping }
      get :show, :id => "37"
      assigns(:fieldmapping).should be(mock_fieldmapping)
    end
  end

  describe "GET new" do
    it "assigns a new fieldmapping as @fieldmapping" do
      Fieldmapping.stub(:new) { mock_fieldmapping }
      get :new
      assigns(:fieldmapping).should be(mock_fieldmapping)
    end
  end

  describe "GET edit" do
    it "assigns the requested fieldmapping as @fieldmapping" do
      Fieldmapping.stub(:find).with("37") { mock_fieldmapping }
      get :edit, :id => "37"
      assigns(:fieldmapping).should be(mock_fieldmapping)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fieldmapping as @fieldmapping" do
        Fieldmapping.stub(:new).with({'these' => 'params'}) { mock_fieldmapping(:save => true) }
        post :create, :fieldmapping => {'these' => 'params'}
        assigns(:fieldmapping).should be(mock_fieldmapping)
      end

      it "redirects to the created fieldmapping" do
        Fieldmapping.stub(:new) { mock_fieldmapping(:save => true) }
        post :create, :fieldmapping => {}
        response.should redirect_to(fieldmapping_url(mock_fieldmapping))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fieldmapping as @fieldmapping" do
        Fieldmapping.stub(:new).with({'these' => 'params'}) { mock_fieldmapping(:save => false) }
        post :create, :fieldmapping => {'these' => 'params'}
        assigns(:fieldmapping).should be(mock_fieldmapping)
      end

      it "re-renders the 'new' template" do
        Fieldmapping.stub(:new) { mock_fieldmapping(:save => false) }
        post :create, :fieldmapping => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fieldmapping" do
        Fieldmapping.should_receive(:find).with("37") { mock_fieldmapping }
        mock_fieldmapping.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fieldmapping => {'these' => 'params'}
      end

      it "assigns the requested fieldmapping as @fieldmapping" do
        Fieldmapping.stub(:find) { mock_fieldmapping(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:fieldmapping).should be(mock_fieldmapping)
      end

      it "redirects to the fieldmapping" do
        Fieldmapping.stub(:find) { mock_fieldmapping(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(fieldmapping_url(mock_fieldmapping))
      end
    end

    describe "with invalid params" do
      it "assigns the fieldmapping as @fieldmapping" do
        Fieldmapping.stub(:find) { mock_fieldmapping(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:fieldmapping).should be(mock_fieldmapping)
      end

      it "re-renders the 'edit' template" do
        Fieldmapping.stub(:find) { mock_fieldmapping(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fieldmapping" do
      Fieldmapping.should_receive(:find).with("37") { mock_fieldmapping }
      mock_fieldmapping.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fieldmappings list" do
      Fieldmapping.stub(:find) { mock_fieldmapping }
      delete :destroy, :id => "1"
      response.should redirect_to(fieldmappings_url)
    end
  end

end
