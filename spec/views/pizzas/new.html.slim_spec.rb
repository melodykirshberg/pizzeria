require 'rails_helper'

RSpec.describe "pizzas/new", type: :view do
  let(:pizza) { create(:pizza) }
  let!(:toppings) { create_list(:topping, 2) }
  let(:chef) { create(:user, :chef) }

  before do
    allow(view).to receive(:current_user).and_return(chef)
    assign(:pizza, pizza)
    render
  end

  context "when a chef visits" do
    it "renders new pizza form" do
      expect(rendered).to have_selector("form[action='#{pizza_path(pizza)}'][method='post']")
    end

   it "displays the new pizza in the form" do
      expect(rendered).to match("New pizza")
    end

    it "shows all available toppings" do
      toppings.each do |topping|
        expect(rendered).to match(topping.name)
      end
    end

    it "shows the create and back button" do
      allow(controller).to receive(:params).and_return(ActionController::Parameters.new(action: "new"))
      render
      expect(rendered).to match("Create Pizza")
      expect(rendered).to have_link("Back to pizzas", href: pizzas_path)
    end
  end
end
