require "spec_helper"

describe RecipientsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/recipients" }.should route_to(:controller => "recipients", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/recipients/new" }.should route_to(:controller => "recipients", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/recipients/1" }.should route_to(:controller => "recipients", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/recipients/1/edit" }.should route_to(:controller => "recipients", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/recipients" }.should route_to(:controller => "recipients", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/recipients/1" }.should route_to(:controller => "recipients", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/recipients/1" }.should route_to(:controller => "recipients", :action => "destroy", :id => "1")
    end

  end
end
