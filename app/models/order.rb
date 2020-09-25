class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sell_good
  has_one :address
end
