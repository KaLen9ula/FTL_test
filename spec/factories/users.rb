require 'ffaker'

FactoryBot.define do
  password = FFaker::Internet.password

  factory :user do
    email { FFaker::Internet.unique.email }
    password { password }
    password_confirmation { password }
  end
end
