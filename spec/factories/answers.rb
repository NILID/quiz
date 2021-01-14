FactoryBot.define do
  factory :answer do
#    title {  Faker::Lorem.unique.word }
        sequence(:title)   { |n| "Answer number #{n}" }

    correct { false }
  end
end
