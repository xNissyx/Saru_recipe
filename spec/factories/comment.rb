FactoryBot.define do
  factory :comment do
    association :user
    association :recipe
    content { "test" }
    score { 3 }
  end
end
