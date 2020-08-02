FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }

    trait :with_profile do
      after :build do |user|
        build(:profile, user: user)
      end
    end
  end
end
