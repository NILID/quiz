FactoryBot.define do
  factory :question do
    title { Faker::Lorem.unique.paragraph }

    association :author, factory: :user
    answers { build_list(:answer, 4) }
  end
end
