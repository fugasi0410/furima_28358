FactoryBot.define do
  factory :user do
    name {"ふが"}
    email {Faker::Internet.free_email}
    password {"0000000"}
    password_confirmation {password}
  end
end
