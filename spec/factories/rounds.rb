FactoryBot.define do
  factory :round do
    theme
    user
    current_answers { 1 }
    wrong_answers { 1 }
    finished { false }
  end
end
