FactoryGirl.define do
  factory :user do
    name Faker::Name.first_name + Random.new.rand(2).to_s
  end
end
