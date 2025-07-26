require "rails_helper"

RSpec.describe PizzaToppingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pizza_toppings").to route_to("pizza_toppings#index")
    end

    it "routes to #new" do
      expect(get: "/pizza_toppings/new").to route_to("pizza_toppings#new")
    end

    it "routes to #show" do
      expect(get: "/pizza_toppings/1").to route_to("pizza_toppings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/pizza_toppings/1/edit").to route_to("pizza_toppings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pizza_toppings").to route_to("pizza_toppings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pizza_toppings/1").to route_to("pizza_toppings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pizza_toppings/1").to route_to("pizza_toppings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pizza_toppings/1").to route_to("pizza_toppings#destroy", id: "1")
    end
  end
end
