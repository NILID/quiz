FactoryBot.define do
  factory :question do
    title { Faker::Lorem.unique.paragraph }
    association :author, factory: :user
  end
end
