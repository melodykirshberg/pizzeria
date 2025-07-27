require 'rails_helper'

RSpec.describe "/toppings", type: :request do
  let(:user) { create(:user, :owner) }
  let!(:toppings) { create_list(:topping, 2) }
  let(:valid_attributes) { { name: Faker::Food.unique.dish } }
  let(:invalid_attributes) { { name: "" } }

  before do
    sign_in user, scope: :user
  end

  describe "GET /index" do
    it "renders a successful response" do
      get toppings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get topping_url(toppings.first)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_topping_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_topping_url(toppings.first)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Topping" do
        expect {
          post toppings_url, params: { topping: valid_attributes }
        }.to change(Topping, :count).by(1)
      end

      it "redirects to the created topping" do
        post toppings_url, params: { topping: valid_attributes }
        expect(response).to redirect_to(topping_url(Topping.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Topping" do
        expect {
          post toppings_url, params: { topping: invalid_attributes }
        }.to change(Topping, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post toppings_url, params: { topping: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested topping" do
        patch topping_url(toppings.first), params: { topping: valid_attributes }
        toppings.first.reload
        expect(response).to have_http_status(:redirect)
      end

      it "redirects to the topping" do
        patch topping_url(toppings.first), params: { topping: valid_attributes }
        toppings.first.reload
        expect(response).to redirect_to(topping_url(toppings.first))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status" do
        patch topping_url(toppings.first), params: { topping: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested topping" do
      expect { delete topping_url(toppings.first)
      }.to change(Topping, :count).by(-1)
    end

    it "redirects to the toppings list" do
      delete topping_url(toppings.first)
      expect(response).to redirect_to(toppings_url)
    end
  end
end
