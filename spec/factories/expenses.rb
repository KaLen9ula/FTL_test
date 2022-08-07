require 'ffaker'

FactoryBot.define do
  factory :expense do
    title {  FFaker::Lorem.sentence(2) }
    description { FFaker::Lorem.sentence(5) }
    category { ['Traveling', 'Clothing', 'Taxi', 'Cafes', 'Shops', 'Other'].sample }
    amount { rand(10..1000) }
    user
  end
end
