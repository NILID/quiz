FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.unique.email }
    password              { 'password' }
    password_confirmation { 'password' }

    trait(:admin) do
      role { 'admin' }
    end

    trait(:moderator) do
      role { 'moderator' }
    end
  end
end
