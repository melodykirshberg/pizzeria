FactoryBot.define do
  factory :topping do
    name { Faker::Food.unique.ingredient }
  end
end
