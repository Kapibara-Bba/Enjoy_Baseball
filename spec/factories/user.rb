FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    team
  end

  factory :user2 do
    name { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    team
  end
end
