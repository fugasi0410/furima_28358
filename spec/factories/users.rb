FactoryBot.define do
  factory :user do
    name {"huga"}
    email {Faker::Internet.free_email}
    password {"0000000"}
    password_confirmation {password}
  end
end
