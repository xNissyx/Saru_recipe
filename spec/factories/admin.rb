FactoryBot.define do
  factory :admin do
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
