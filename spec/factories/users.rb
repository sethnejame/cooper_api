FactoryBot.define do
  factory :user do
    email { "sethnejame@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
