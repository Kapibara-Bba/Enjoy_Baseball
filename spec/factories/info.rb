FactoryBot.define do
  factory :info do
    body { Faker::Lorem.characters(number:10) }
    
  end
end