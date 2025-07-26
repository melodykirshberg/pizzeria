require 'rails_helper'

RSpec.describe "pizza_toppings/new", type: :view do
  before(:each) do
    assign(:pizza_topping, PizzaTopping.new(
      pizza: nil,
      topping: nil
    ))
  end

  it "renders new pizza_topping form" do
    render

    assert_select "form[action=?][method=?]", pizza_toppings_path, "post" do

      assert_select "input[name=?]", "pizza_topping[pizza_id]"

      assert_select "input[name=?]", "pizza_topping[topping_id]"
    end
  end
end
