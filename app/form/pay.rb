class Pay

  include ActiveModel::Model
  attr_accessor :token, :user_id, :sell_good_id,:post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number
  
  with_options presence: true do
    validates :token
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :street_number
    # validates :building_name
    validates :phone_number
  end
  def save
    order = Order.create(user_id: user_id,sell_good_id: sell_good_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end