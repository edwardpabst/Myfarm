require 'spec_helper'

describe FarmjobsController do

  def mock_farmjob(stubs={})
    (@mock_farmjob ||= mock_model(Farmjob).as_null_object).tap do |farmjob|
      farmjob.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all farmjobs as @farmjobs" do
      Farmjob.stub(:all) { [mock_farmjob] }
      get :index
      assigns(:farmjobs).should eq([mock_farmjob])
    end
  end

  describe "GET show" do
    it "assigns the requested farmjob as @farmjob" do
      Farmjob.stub(:find).with("37") { mock_farmjob }
      get :show, :id => "37"
      assigns(:farmjob).should be(mock_farmjob)
    end
  end

  describe "GET new" do
    it "assigns a new farmjob as @farmjob" do
      Farmjob.stub(:new) { mock_farmjob }
      get :new
      assigns(:farmjob).should be(mock_farmjob)
    end
  end

  describe "GET edit" do
    it "assigns the requested farmjob as @farmjob" do
      Farmjob.stub(:find).with("37") { mock_farmjob }
      get :edit, :id => "37"
      assigns(:farmjob).should be(mock_farmjob)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created farmjob as @farmjob" do
        Farmjob.stub(:new).with({'these' => 'params'}) { mock_farmjob(:save => true) }
        post :create, :farmjob => {'these' => 'params'}
        assigns(:farmjob).should be(mock_farmjob)
      end

      it "redirects to the created farmjob" do
        Farmjob.stub(:new) { mock_farmjob(:save => true) }
        post :create, :farmjob => {}
        response.should redirect_to(farmjob_url(mock_farmjob))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved farmjob as @farmjob" do
        Farmjob.stub(:new).with({'these' => 'params'}) { mock_farmjob(:save => false) }
        post :create, :farmjob => {'these' => 'params'}
        assigns(:farmjob).should be(mock_farmjob)
      end

      it "re-renders the 'new' template" do
        Farmjob.stub(:new) { mock_farmjob(:save => false) }
        post :create, :farmjob => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested farmjob" do
        Farmjob.should_receive(:find).with("37") { mock_farmjob }
        mock_farmjob.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :farmjob => {'these' => 'params'}
      end

      it "assigns the requested farmjob as @farmjob" do
        Farmjob.stub(:find) { mock_farmjob(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:farmjob).should be(mock_farmjob)
      end

      it "redirects to the farmjob" do
        Farmjob.stub(:find) { mock_farmjob(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(farmjob_url(mock_farmjob))
      end
    end

    describe "with invalid params" do
      it "assigns the farmjob as @farmjob" do
        Farmjob.stub(:find) { mock_farmjob(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:farmjob).should be(mock_farmjob)
      end

      it "re-renders the 'edit' template" do
        Farmjob.stub(:find) { mock_farmjob(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested farmjob" do
      Farmjob.should_receive(:find).with("37") { mock_farmjob }
      mock_farmjob.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the farmjobs list" do
      Farmjob.stub(:find) { mock_farmjob }
      delete :destroy, :id => "1"
      response.should redirect_to(farmjobs_url)
    end
  end

end
