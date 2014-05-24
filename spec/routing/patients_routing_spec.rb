require "spec_helper"

describe PatientsController, :type => :routing do
  describe "routing without locale" do
    it "routes to #index" do
      expect(:get => "/patients").to route_to("patients#index")
    end

    it "routes to #new" do
      expect(:get => "/patients/new").to route_to("patients#new")
    end

    it "routes to #show" do
      expect(:get => "/patients/1").to route_to("patients#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/patients/1/edit").to route_to("patients#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/patients").to route_to("patients#create")
    end

    it "routes to #update" do
      expect(:put => "/patients/1").to route_to("patients#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/patients/1").to route_to("patients#destroy", :id => "1")
    end

    it "root routes to #index" do
      expect(:get => "/").to route_to("patients#index")
    end

  end

  describe "routing with locale" do
    it "routes to #index" do
      expect(:get => "/en/patients").to route_to("patients#index", :locale => "en")
      expect(:get => "/zh-CN/patients").to route_to("patients#index", :locale => "zh-CN")
      
    end
    it "routes to #new" do
      expect(:get => "/en/patients/new").to route_to("patients#new", :locale => "en")
      expect(:get => "/zh-CN/patients/new").to route_to("patients#new", :locale => "zh-CN")
    end

    it "routes to #show" do
      expect(:get => "/en/patients/1").to route_to("patients#show", :id => "1", :locale => "en")
      expect(:get => "/zh-CN/patients/1").to route_to("patients#show", :id => "1", :locale => "zh-CN")
    end

    it "routes to #edit" do
      expect(:get => "/en/patients/1/edit").to route_to("patients#edit", :id => "1", :locale => "en")
      expect(:get => "/zh-CN/patients/1/edit").to route_to("patients#edit", :id => "1", :locale => "zh-CN")
    end

    it "routes to #create" do
      expect(:post => "/en/patients").to route_to("patients#create", :locale => "en")
      expect(:post => "/zh-CN/patients").to route_to("patients#create", :locale => "zh-CN")
      
    end

    it "routes to #update" do
      expect(:put => "/en/patients/1").to route_to("patients#update", :id => "1", :locale => "en")
      expect(:put => "/zh-CN/patients/1").to route_to("patients#update", :id => "1", :locale => "zh-CN")
    end

    it "routes to #destroy" do
      expect(:delete => "/en/patients/1").to route_to("patients#destroy", :id => "1", :locale => "en")
      expect(:delete => "/zh-CN/patients/1").to route_to("patients#destroy", :id => "1", :locale => "zh-CN")
    end

    it "root routes to #index" do
      expect(:get => "/en").to route_to("patients#index", :locale => "en")
      expect(:get => "/zh-CN").to route_to("patients#index", :locale => "zh-CN")
    end

  end
end
