require 'rails_helper'

RSpec.describe User, type: :model do
  let(:owner_user) { create(:user, :owner) }
  let(:chef_user) { create(:user, :chef) }
  let(:invalid_user) { build(:user, role: "random_role") }
  let(:roleless_user) { create(:user, role: nil) }
  describe "validations" do
    it "is valid with valid attributes" do
      expect(owner_user).to be_valid
    end

    it "is invalid with an unsupported role" do
      expect(invalid_user).not_to be_valid
      expect(invalid_user.errors[:role]).to include("is not included in the list")
    end
  end

  describe "default role" do
    it "defaults to 'chef' if no role is set" do
      expect(roleless_user.role).to eq("chef")
    end
  end

  describe "#owner?" do
    it "returns true if role is owner" do
      expect(owner_user.owner?).to be true
    end

    it "returns false if role is not owner" do
      expect(chef_user.owner?).to be false
    end
  end

  describe "#chef?" do
    it "returns true if role is chef" do
      expect(chef_user.chef?).to be true
    end

    it "returns false if role is not chef" do
      expect(owner_user.chef?).to be false
    end
  end

  describe "#has_role?" do
    it "returns true for a matching role" do
      expect(owner_user.has_role?("owner")).to be true
    end

    it "returns false for a non-matching role" do
      expect(chef_user.has_role?("owner")).to be false
    end
  end
end
