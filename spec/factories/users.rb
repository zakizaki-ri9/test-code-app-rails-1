FactoryBot.define do
  factory :user do
    id { 999 }
    name { 'example' }
    email { 'example@example.com' }
    password { 'example' }
    password_confirmation { 'example' }
  end
  factory :user_nil, class: User do
    id {nil}
    name {nil}
    email {nil}
    password { nil }
    password_confirmation { nil }
  end
end
