FactoryBot.define do
  factory :recipe do
    association :user
    title { "test" }
    description { "test" }
  end
end
