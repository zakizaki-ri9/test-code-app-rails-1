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
  factory :user_admin, class: User do
    id { 999 }
    name { 'admin_test' }
    email { 'admin_test@admin.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end
end
