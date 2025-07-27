require 'rails_helper'

RSpec.describe "pizzas/index", type: :view do
  let!(:pizzas) { create_list(:pizza, 2) }
  let(:toppings) { create_list(:topping, 2) }
  let(:chef) { create(:user, :chef) }

  before do
    allow(view).to receive(:current_user).and_return(chef)
    assign(:pizzas, pizzas)
    pizzas.first.toppings << toppings
    render
  end

  context "when a chef visits" do
    it "renders a list of all the pizzas and their toppings" do
      render
      pizzas.each do |pizza|
        expect(rendered).to match(pizza.name)
        pizza.toppings.each do |topping|
          expect(rendered).to match(topping.name)
        end
      end
    end

    it "shows the new pizza button" do
      expect(rendered).to have_link("New pizza", href: new_pizza_path)
    end

    it "shows show, edit and destroy buttons for each pizza" do
      pizzas.each do |pizza|
        expect(rendered).to have_link("Show", href: pizza_path(pizza))
        expect(rendered).to have_link("Edit", href: edit_pizza_path(pizza))
        expect(rendered).to have_button("Destroy")
      end
    end
  end
end
