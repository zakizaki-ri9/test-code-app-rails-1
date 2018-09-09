FactoryBot.define do
  factory :user do
    id { 999 }
    name { "example" }
    email { "example@example.com" }
    password { "example" }
    password_confirmation { "example" }
  end
end
