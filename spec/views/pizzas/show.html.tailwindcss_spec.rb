require 'rails_helper'

RSpec.describe "pizzas/show", type: :view do
  before(:each) do
    assign(:pizza, Pizza.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
