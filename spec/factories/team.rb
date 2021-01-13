FactoryBot.define do
  factory :team do
    teamname { Faker::Lorem.characters(number:10) }
    prefecture_code { rand(1..47) }
    city { Faker::Address.city }
  end
end
