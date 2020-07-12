FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.characters(number: 300) }
  end
end
