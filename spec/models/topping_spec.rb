require 'rails_helper'

RSpec.describe Topping, type: :model do
  let(:topping) { create(:topping) }
  let(:topping_name_normalize) { create(:topping, name: "   green peppers") }

  describe "associations" do
    it { should have_many(:pizza_toppings).dependent(:destroy) }
    it { should have_many(:pizzas).through(:pizza_toppings) }
  end

  describe "validations" do
   it "is valid with valid attributes" do
      expect(topping).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_most(30) }

    it "is invalid with a duplicate name" do
      duplicate = build(:topping, name: topping.name)
      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:name]).to include("has already been taken")
    end
  end

  describe "callbacks" do
    it "normalizes the name before saving" do
      expect(topping_name_normalize.name).to eq("Green Peppers")
    end
  end
 end
