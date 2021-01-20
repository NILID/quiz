FactoryBot.define do
  factory :round do
    theme { nil }
    user { nil }
    current_answers { 1 }
    wrong_answers { 1 }
    finished { false }
  end
end
