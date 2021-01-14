FactoryBot.define do
  factory :question do
    title { Faker::Lorem.unique.paragraph }

    association :author, factory: :user

    transient do
      answers_count { 4 }
    end

    before(:create) do |question, evaluator|
      create_list(:answer, evaluator.answers_count, question: question)
    end
  end
end
