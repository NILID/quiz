FactoryBot.define do
  factory :result do
    question
    round
    user
    success { false }
  end
end
