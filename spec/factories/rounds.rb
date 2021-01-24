FactoryBot.define do
  factory :round do
    current_answers { 1 }
    wrong_answers { 1 }
    finished { false }
    theme
    user
  end
end
