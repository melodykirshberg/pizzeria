require 'rails_helper'

RSpec.describe "pizza_toppings/edit", type: :view do
  let(:pizza) { create(:pizza) }
  let(:topping) { create(:topping) }
  let(:pizza_topping) { create(:pizza_topping, pizza: pizza, topping: topping)  }

  before(:each) do
    assign(:pizza_topping, pizza_topping)
  end

  it "renders the edit pizza_topping form" do
    render

    assert_select "form[action=?][method=?]", pizza_topping_path(pizza_topping), "post" do
      assert_select "input[name=?]", "pizza_topping[pizza_id]"

      assert_select "input[name=?]", "pizza_topping[topping_id]"
    end
  end
end
