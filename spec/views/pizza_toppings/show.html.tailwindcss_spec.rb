require 'rails_helper'

RSpec.describe "pizza_toppings/show", type: :view do
  let(:pizza) { create(:pizza) }
  let(:topping) { create(:topping) }
  let(:pizza_topping) { create(:pizza_topping, pizza: pizza, topping: topping)  }

  it "renders attributes in <p>" do
    assign(:pizza_topping, pizza_topping)
    render
    expect(rendered).to match(pizza.name)
    expect(rendered).to match(topping.name)
  end
end
