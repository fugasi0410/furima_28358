# テーブル設計

データベース設計
# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_katakana | string | null: false |
| first_name_katakana  | string | null: false |
| birth_day            | date   | null: false |

### Association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy


## buyer　(購入者情報) テーブル

| Column               | Type    | Options                        |
| -------------------- | ------- | ------------------------------ |
| user_id              | integer | null: false, foreign_key: true |
| prefecture           | string  | null: false                    |
| city                 | string  | null: false                    |
| email                | string  | null: false                    |
| phone_number         | string  | null: false                    |

### Association

- belongs_to :user

## sell_goods テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| name    | string  | null: false                    |
| prise   | string  | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| status  | string  | null: false                    |
| cost    | string  | null: false                    |
| size    | string  | null: false                    |

### Association

- belongs_to :user dependent: :destroy
- has_many :images dependent: :destroy

## image テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| image            | string  | null: false                    |
| sell_goods_id    | integer | null: false, foreign_key: true |

### Association

- has_many :products
