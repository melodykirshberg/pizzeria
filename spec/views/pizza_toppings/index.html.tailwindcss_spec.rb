require 'rails_helper'

RSpec.describe "pizza_toppings/index", type: :view do
  let(:pizzas) { create_list(:pizza, 2) }
  let(:toppings) { create_list(:topping, 2) }
  let(:pizza_toppings) do
    [
      create(:pizza_topping, pizza: pizzas[0], topping: toppings[0]),
      create(:pizza_topping, pizza: pizzas[1], topping: toppings[1])
    ]
  end
  before(:each) do
    assign(:pizza_toppings, pizza_toppings)
  end

  it "renders a list of pizza_toppings" do
    render
    pizza_toppings.each do |pt|
      expect(rendered).to include(pt.pizza.name)
      expect(rendered).to include(pt.topping.name)
    end
  end
end
