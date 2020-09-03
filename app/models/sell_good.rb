class SellGood < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :prise, numericality:{greater_than_or_equal_to: 300}, numericality:{less_than_or_equal_to: 9999999}
    validates :status
    validates :cost
    validates :size
    validates　:category
    validates　:shipping_cost
    validates　:shipping_days
    validates　:shipping_prefecture
  end
end
