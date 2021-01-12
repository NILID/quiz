FactoryBot.define do
  factory :question do
    title { Faker::Lorem.unique.paragraph }
    answer1 { 'Answer One' }
    answer2 { 'Answer Two' }
    answer3 { 'Answer Three' }
    answer4 { 'Answer Four' }

    association :author, factory: :user
  end
end
