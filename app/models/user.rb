class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sell_goods, dependent: :destroy
  # has_one :order, dependent: :destroy

  with_options presence: true do
    validates :name, length: { in: 1..6 }  
    validates :email, uniqueness: true, format:{ with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :family_name, :first_name
    validates :family_name_katakana, :first_name_katakana
    validates :birth_day
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/ }
  end
  
  # 全角のカタカナを使用していないかどうかを検証
  with_options presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/, message:'Full-width katakana characters' }do
    validates :family_name_katakana
    validates :first_name_katakana
  end

  with_options presence: true, format: { with: (/\A[ぁ-んァ-ンー-領]/), message:'Full-width characters' }do
    validates :family_name
    validates :first_name
  end
end