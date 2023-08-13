# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    add_attribute(:name) { Faker::Name.name }
    add_attribute(:email) { Faker::Internet.email }
    add_attribute(:password) { Faker::Internet.password }
  end
end
