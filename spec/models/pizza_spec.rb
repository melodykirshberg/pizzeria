require 'rails_helper'

RSpec.describe Pizza, type: :model do
  let(:pizza) { create(:pizza) }
  let(:pizza_name_normalize) { create(:pizza, name: "  bbq chicken ") }

  describe "associations" do
    it { should have_many(:pizza_toppings).dependent(:destroy) }
    it { should have_many(:toppings).through(:pizza_toppings) }
  end

  describe "validations" do
   it "is valid with valid attributes" do
      expect(pizza).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_most(30) }

    it "is invalid with a duplicate name" do
      duplicate = build(:pizza, name: pizza.name)
      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:name]).to include("has already been taken")
    end
  end

  describe "callbacks" do
    it "normalizes the name before saving" do
      expect(pizza_name_normalize.name).to eq("Bbq Chicken")
    end
  end
end
