require 'rails_helper'

RSpec.describe "toppings/edit", type: :view do
 let(:topping) { create(:topping) }
  let!(:pizzas) { create_list(:pizza, 2) }
  let(:owner) { create(:user, :owner) }

  before do
    allow(view).to receive(:current_user).and_return(owner)
    assign(:topping, topping)
    render
  end

  context "when a owner visits" do
    it "renders the edit topping form" do
      expect(rendered).to have_selector("form[action='#{topping_path(topping)}'][method='post']")
    end

    it "displays the current topping name in the form" do
      expect(rendered).to match("Editing #{topping.name}")
    end

    it "shows the update, cancel and back button" do
      allow(controller).to receive(:params).and_return(ActionController::Parameters.new(action: "edit"))
      render
      expect(rendered).to have_button("Update #{topping.name}")
      expect(rendered).to have_link("Cancel", href: topping_path(topping))
      expect(rendered).to have_link("Back to topping", href: toppings_path)
    end
  end
end
