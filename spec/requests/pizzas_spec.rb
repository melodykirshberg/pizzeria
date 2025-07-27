require 'rails_helper'

RSpec.describe "/pizzas", type: :request do
  let(:user) { create(:user, :chef) }
  let!(:pizzas) { create_list(:pizza, 2) }
  let(:valid_attributes) { { name: Faker::Food.unique.dish } }
  let(:invalid_attributes) { { name: "" } }

  before do
    sign_in user, scope: :user
  end

  describe "GET /index" do
    it "renders a successful response" do
      get pizzas_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get pizza_url(pizzas.first)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pizza_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_pizza_url(pizzas.first)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pizza" do
        expect {
          post pizzas_url, params: { pizza: valid_attributes }
        }.to change(Pizza, :count).by(1)
      end

      it "redirects to the created pizza" do
        post pizzas_url, params: { pizza: valid_attributes }
        expect(response).to redirect_to(pizza_url(Pizza.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pizza" do
        expect {
          post pizzas_url, params: { pizza: invalid_attributes }
        }.to change(Pizza, :count).by(0)
      end

      it "renders a response with 422 status" do
        post pizzas_url, params: { pizza: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested pizza" do
        patch pizza_url(pizzas.first), params: { pizza: valid_attributes }
        pizzas.first.reload
        expect(response).to have_http_status(:redirect)
      end

      it "redirects to the pizza" do
        patch pizza_url(pizzas.first), params: { pizza: valid_attributes }
        pizzas.first.reload
        expect(response).to redirect_to(pizza_url(pizzas.first))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        patch pizza_url(pizzas.first), params: { pizza: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pizza" do
      expect { delete pizza_url(pizzas.last)
      }.to change(Pizza, :count).by(-1)
    end

    it "redirects to the pizzas list" do
      delete pizza_url(pizzas.last)
      expect(response).to redirect_to(pizzas_url)
    end
  end
end
