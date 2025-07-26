require 'rails_helper'

RSpec.describe "toppings/index", type: :view do
  let(:toppings) { create_list(:topping, 3) }


  it "renders a list of toppings" do
    assign(:toppings, toppings)
    render
      toppings.each do |topping|
      expect(rendered).to match(topping.name)
    end
  end
end
