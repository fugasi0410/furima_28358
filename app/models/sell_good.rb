class SellGood < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :size
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :shipping_prefecture
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name
    validates :price
    validates :status
    validates :size
    validates :category
    validates :shipping_cost
    validates :shipping_day
    validates :shipping_prefecture
  end

  # 金額の範囲
  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

  # validates :price, numericality:{greater_than_or_equal_to: 300}, numericality:{less_than_or_equal_to: 9999999}

end
