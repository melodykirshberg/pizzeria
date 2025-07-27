FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.unique.password }

  trait :chef do
      role { "chef" }
    end

    trait :owner do
      role { "owner" }
    end
  end
end
