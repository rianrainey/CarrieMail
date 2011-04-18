require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe RecipientsController do

  def mock_recipient(stubs={})
    @mock_recipient ||= mock_model(Recipient, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all recipients as @recipients" do
      Recipient.stub(:all) { [mock_recipient] }
      get :index
      assigns(:recipients).should eq([mock_recipient])
    end
  end

  describe "GET show" do
    it "assigns the requested recipient as @recipient" do
      Recipient.stub(:find).with("37") { mock_recipient }
      get :show, :id => "37"
      assigns(:recipient).should be(mock_recipient)
    end
  end

  describe "GET new" do
    it "assigns a new recipient as @recipient" do
      Recipient.stub(:new) { mock_recipient }
      get :new
      assigns(:recipient).should be(mock_recipient)
    end
  end

  describe "GET edit" do
    it "assigns the requested recipient as @recipient" do
      Recipient.stub(:find).with("37") { mock_recipient }
      get :edit, :id => "37"
      assigns(:recipient).should be(mock_recipient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created recipient as @recipient" do
        Recipient.stub(:new).with({'these' => 'params'}) { mock_recipient(:save => true) }
        post :create, :recipient => {'these' => 'params'}
        assigns(:recipient).should be(mock_recipient)
      end

      it "redirects to the created recipient" do
        Recipient.stub(:new) { mock_recipient(:save => true) }
        post :create, :recipient => {}
        response.should redirect_to(recipient_url(mock_recipient))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipient as @recipient" do
        Recipient.stub(:new).with({'these' => 'params'}) { mock_recipient(:save => false) }
        post :create, :recipient => {'these' => 'params'}
        assigns(:recipient).should be(mock_recipient)
      end

      it "re-renders the 'new' template" do
        Recipient.stub(:new) { mock_recipient(:save => false) }
        post :create, :recipient => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested recipient" do
        Recipient.stub(:find).with("37") { mock_recipient }
        mock_recipient.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :recipient => {'these' => 'params'}
      end

      it "assigns the requested recipient as @recipient" do
        Recipient.stub(:find) { mock_recipient(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:recipient).should be(mock_recipient)
      end

      it "redirects to the recipient" do
        Recipient.stub(:find) { mock_recipient(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(recipient_url(mock_recipient))
      end
    end

    describe "with invalid params" do
      it "assigns the recipient as @recipient" do
        Recipient.stub(:find) { mock_recipient(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:recipient).should be(mock_recipient)
      end

      it "re-renders the 'edit' template" do
        Recipient.stub(:find) { mock_recipient(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested recipient" do
      Recipient.stub(:find).with("37") { mock_recipient }
      mock_recipient.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the recipients list" do
      Recipient.stub(:find) { mock_recipient }
      delete :destroy, :id => "1"
      response.should redirect_to(recipients_url)
    end
  end

end
