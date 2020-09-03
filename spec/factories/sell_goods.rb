FactoryBot.define do
  factory :sell_good do
    name {"ふーが"}
    cost {400}
    association :user dependent: :destroy
    association :images dependent: :destroy
  end
end
