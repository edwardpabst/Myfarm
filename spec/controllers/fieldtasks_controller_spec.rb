require 'spec_helper'

describe FieldtasksController do

  def mock_fieldtask(stubs={})
    (@mock_fieldtask ||= mock_model(Fieldtask).as_null_object).tap do |fieldtask|
      fieldtask.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all fieldtasks as @fieldtasks" do
      Fieldtask.stub(:all) { [mock_fieldtask] }
      get :index
      assigns(:fieldtasks).should eq([mock_fieldtask])
    end
  end

  describe "GET show" do
    it "assigns the requested fieldtask as @fieldtask" do
      Fieldtask.stub(:find).with("37") { mock_fieldtask }
      get :show, :id => "37"
      assigns(:fieldtask).should be(mock_fieldtask)
    end
  end

  describe "GET new" do
    it "assigns a new fieldtask as @fieldtask" do
      Fieldtask.stub(:new) { mock_fieldtask }
      get :new
      assigns(:fieldtask).should be(mock_fieldtask)
    end
  end

  describe "GET edit" do
    it "assigns the requested fieldtask as @fieldtask" do
      Fieldtask.stub(:find).with("37") { mock_fieldtask }
      get :edit, :id => "37"
      assigns(:fieldtask).should be(mock_fieldtask)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fieldtask as @fieldtask" do
        Fieldtask.stub(:new).with({'these' => 'params'}) { mock_fieldtask(:save => true) }
        post :create, :fieldtask => {'these' => 'params'}
        assigns(:fieldtask).should be(mock_fieldtask)
      end

      it "redirects to the created fieldtask" do
        Fieldtask.stub(:new) { mock_fieldtask(:save => true) }
        post :create, :fieldtask => {}
        response.should redirect_to(fieldtask_url(mock_fieldtask))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fieldtask as @fieldtask" do
        Fieldtask.stub(:new).with({'these' => 'params'}) { mock_fieldtask(:save => false) }
        post :create, :fieldtask => {'these' => 'params'}
        assigns(:fieldtask).should be(mock_fieldtask)
      end

      it "re-renders the 'new' template" do
        Fieldtask.stub(:new) { mock_fieldtask(:save => false) }
        post :create, :fieldtask => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fieldtask" do
        Fieldtask.should_receive(:find).with("37") { mock_fieldtask }
        mock_fieldtask.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fieldtask => {'these' => 'params'}
      end

      it "assigns the requested fieldtask as @fieldtask" do
        Fieldtask.stub(:find) { mock_fieldtask(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:fieldtask).should be(mock_fieldtask)
      end

      it "redirects to the fieldtask" do
        Fieldtask.stub(:find) { mock_fieldtask(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(fieldtask_url(mock_fieldtask))
      end
    end

    describe "with invalid params" do
      it "assigns the fieldtask as @fieldtask" do
        Fieldtask.stub(:find) { mock_fieldtask(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:fieldtask).should be(mock_fieldtask)
      end

      it "re-renders the 'edit' template" do
        Fieldtask.stub(:find) { mock_fieldtask(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fieldtask" do
      Fieldtask.should_receive(:find).with("37") { mock_fieldtask }
      mock_fieldtask.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fieldtasks list" do
      Fieldtask.stub(:find) { mock_fieldtask }
      delete :destroy, :id => "1"
      response.should redirect_to(fieldtasks_url)
    end
  end

end
