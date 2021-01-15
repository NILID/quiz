FactoryBot.define do
  factory :theme do
    sequence(:title) { |n| "Theme number #{n}" }
  end
end
