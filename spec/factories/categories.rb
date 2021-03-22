FactoryBot.define do
  factory :category do
    name             { Faker::Lorem.sentence(8) }
    association      :idea
  end
end
