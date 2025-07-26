require 'rails_helper'

RSpec.describe "pizzas/index", type: :view do
  let!(:pizzas) { create_list(:pizza, 3) }

  it "renders a list of pizzas" do
    assign(:pizzas, pizzas)
    render
    pizzas.each do |pizza|
      expect(rendered).to match(pizza.name)
    end
  end
end
