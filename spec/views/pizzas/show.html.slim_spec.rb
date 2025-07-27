require 'rails_helper'

RSpec.describe "pizzas/show", type: :view do
  let(:pizza) { create(:pizza) }
  let!(:toppings) { create_list(:topping, 2) }
  let(:chef) { create(:user, :chef) }

  before do
    allow(view).to receive(:current_user).and_return(chef)
    assign(:pizza, pizza)
    pizza.toppings << toppings
    render
  end

  context "when a chef visits" do
    it "renders the pizza show page" do
      expect(rendered).to match("Showing #{pizza.name}")
    end

    it "renders all of the toppings it has" do
      render
        toppings.each do |topping|
          expect(rendered).to match(topping.name)
      end
    end

    it "shows the edit, back and destroy button" do
      expect(rendered).to have_link("Edit #{pizza.name}", href: edit_pizza_path(pizza))
      expect(rendered).to have_link("Back to pizzas", href: pizzas_path)
      expect(rendered).to have_button("Destroy #{pizza.name}")
    end
  end
end
