require 'rails_helper'

RSpec.describe "toppings/show", type: :view do
  let(:topping) { create(:topping) }
  let!(:pizzas) { create_list(:pizza, 2) }
  let(:owner) { create(:user, :owner) }

  before do
    allow(view).to receive(:current_user).and_return(owner)
    assign(:topping, topping)
    topping.pizzas << pizzas
    render
  end

  context "when a owner visits" do
    it "renders the topping show page" do
      expect(rendered).to match("Showing #{topping.name}")
    end

    it "renders all of the pizzas its on" do
      render
        pizzas.each do |pizza|
          expect(rendered).to match(pizza.name)
      end
    end

    it "shows the edit, back and destroy button" do
      expect(rendered).to have_link("Edit #{topping.name}", href: edit_topping_path(topping))
      expect(rendered).to have_link("Back to toppings", href: toppings_path)
      expect(rendered).to have_button("Destroy #{topping.name}")
    end
  end
end
