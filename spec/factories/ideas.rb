FactoryBot.define do
  factory :idea do
    category_id       { Faker::Number.between(from: 1, to: 3) }
    body             { Faker::Lorem.sentence(300) }
  end
end
