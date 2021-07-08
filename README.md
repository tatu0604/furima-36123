## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| surname            | string | null: false               |
| first_name         | string | null: false               |
| kana_surname       | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :buys
- has_many :buys, through: :items

## itemsテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| information      | text       | null: false |
| category_id      | integer    | null: false |
| status_id        | integer    | null: false |
| shipping_id      | integer    | null: false |
| area_id          | integer    | null: false |
| days_id          | integer    | null: false |
| price            | integer    | null: false |
| user             | references |             |

### Association
- belongs_to :user
- has_one :buys

## buysテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| expiration      | text       | null: false |
| security_number | string     | null: false |

### Association
- belongs_to :user
- belongs_to :item

## addressテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| postal_code     | text       | null: false |
| prefecture      | text       | null: false |
| municipality    | text       | null: false |
| address         | text       | null: false |
| building_name   | text       |             |
| phone_number    | integer    | null: false |

### Association
- belongs_to :user
- belongs_to :item