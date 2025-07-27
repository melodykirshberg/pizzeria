FactoryBot.define do
  factory :pizza_topping do
    association :pizza
    association :topping
  end
end
