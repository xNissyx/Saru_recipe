FactoryBot.define do
  factory :ingredient do
    association :recipe
    name { "test" }
    quantity { "3" }
  end
end