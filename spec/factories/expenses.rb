require 'ffaker'

FactoryBot.define do
  factory :expense do
    title {  FFaker::Lorem.sentence(word_count: 2, supplemental: false) }
    description { FFaker::Lorem.sentence(word_count: 5, supplemental: true) }
    category { ['Traveling', 'Clothing', 'Taxi', 'Cafes', 'Shops', 'Other'].sample }
    amount { rand(10..1000) }
    user
  end
end
