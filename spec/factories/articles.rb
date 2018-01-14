FactoryGirl.define do
  factory :article do
    name Faker::Name.name
    price Faker::Number.between(100, 110)
    description Faker::Lorem.sentence
    user nil
  end
end
