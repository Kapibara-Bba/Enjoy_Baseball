FactoryBot.define do
  factory :spot do
    address { rand(1..47) }
    latitude { Faker::Lorem.characters(number:100.00) }
    longitude { Faker::Lorem.characters(number:100.00) }
  end
end
