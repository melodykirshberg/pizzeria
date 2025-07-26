FactoryBot.define do
  factory :pizza do
    name { Faker::Food.unique.dish }
  end
end
