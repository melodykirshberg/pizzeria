require 'rails_helper'

RSpec.describe "toppings/new", type: :view do
  let(:topping) { create(:topping) }
  let!(:pizzas) { create_list(:pizza, 2) }
  let(:owner) { create(:user, :owner) }

  before do
    allow(view).to receive(:current_user).and_return(owner)
    assign(:topping, topping)
    render
  end

  context "when a owner visits" do
    it "renders new topping form" do
      expect(rendered).to have_selector("form[action='#{topping_path(topping)}'][method='post']")
    end

   it "displays the new topping in the form" do
      expect(rendered).to match("New topping")
    end

    it "shows the create and back button" do
      allow(controller).to receive(:params).and_return(ActionController::Parameters.new(action: "new"))
      render
      expect(rendered).to match("Create Topping")
      expect(rendered).to have_link("Back to toppings", href: toppings_path)
    end
  end
end
