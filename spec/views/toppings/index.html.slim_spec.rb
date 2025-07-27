require 'rails_helper'

RSpec.describe "toppings/index", type: :view do
  let!(:toppings) { create_list(:topping, 2) }
  let(:pizzas) { create_list(:pizza, 2) }
  let(:owner) { create(:user, :owner) }

  before do
    allow(view).to receive(:current_user).and_return(owner)
    assign(:toppings, toppings)
    toppings.first.pizzas << pizzas
    render
  end

  context "when a owner visits" do
    it "renders a list of all the toppings and their pizzas" do
      render
        toppings.each do |topping|
          expect(rendered).to match(topping.name)
          topping.pizzas.each do |pizza|
          expect(rendered).to match(pizza.name)
        end
      end
    end

    it "shows the new topping button" do
      expect(rendered).to have_link("New topping", href: new_topping_path)
    end

    it "shows show, edit and destroy buttons for each topping" do
      toppings.each do |topping|
        expect(rendered).to have_link("Show", href: topping_path(topping))
        expect(rendered).to have_link("Edit", href: edit_topping_path(topping))
        expect(rendered).to have_button("Destroy")
      end
    end
  end
end
