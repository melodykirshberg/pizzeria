require 'rails_helper'

RSpec.describe "pizzas/edit", type: :view do
  let(:pizza) { create(:pizza) }
  let!(:toppings) { create_list(:topping, 2) }
  let(:chef) { create(:user, :chef) }

  before do
    allow(view).to receive(:current_user).and_return(chef)
    assign(:pizza, pizza)
    render
  end

  context "when a chef visits" do
    it "renders the edit pizza form" do
      expect(rendered).to have_selector("form[action='#{pizza_path(pizza)}'][method='post']")
    end

    it "displays the current pizza name in the form" do
      expect(rendered).to match(pizza.name)
    end

    it "shows all available toppings" do
      toppings.each do |topping|
        expect(rendered).to match(topping.name)
      end
    end

    it "shows the update, cancel and back button" do
      allow(controller).to receive(:params).and_return(ActionController::Parameters.new(action: "edit"))
      render
      expect(rendered).to have_button("Update #{pizza.name}")
      expect(rendered).to have_link("Cancel", href: pizza_path(pizza))
      expect(rendered).to have_link("Back to pizzas", href: pizzas_path)
    end
  end
end
