FactoryBot.define do
  factory :sell_good do
    name {"ふーが"}
    cost {400}
    association :user
  end
end