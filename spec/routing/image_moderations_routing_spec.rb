require "spec_helper"

describe ImageModerationsController do
  describe "routing" do

    it "routes to #index" do
      get("/image_moderations").should route_to("image_moderations#index")
    end

    it "routes to #new" do
      get("/image_moderations/new").should route_to("image_moderations#new")
    end

    it "routes to #show" do
      get("/image_moderations/1").should route_to("image_moderations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/image_moderations/1/edit").should route_to("image_moderations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/image_moderations").should route_to("image_moderations#create")
    end

    it "routes to #update" do
      put("/image_moderations/1").should route_to("image_moderations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/image_moderations/1").should route_to("image_moderations#destroy", :id => "1")
    end

  end
end
