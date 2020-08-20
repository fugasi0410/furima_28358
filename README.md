# テーブル設計

データベース設計

usersテーブル
name
email
encrypted_password
family_name
first_name
family_name_katakana
first_name_katakana
birth_day

アソシエーション
has_many :products dependent: :destroy
belongs_to :destination dependent: :destroy
belongs_to :card dependent: :destroy

buyerテーブル
family_name
first_name
family_name_katakana
first_name_katakana
user_id
prefecture
city
email
phone_number

アソシエーション
belongs_to :user

sell_goods
name
prise
user_id

アソシエーション
belongs_to :user dependent: :destroy
has_many :images dependent: :destroy

imagesテーブル
image
sell_goods_id

アソシエーション
has_many :products

cardテーブル
user_id
card_id

アソシエーション
belongs_to :user

