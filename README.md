## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| kana_name          | string | null: false |
| birthday           | string | null: false |

### Association
- has_many :items
- has_many :buys
- has_many :buys, through: :items

## itemsテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| information   | text       | null: false |
| category      | string     | null: false |
| status        | string     | null: false |
| shipping      | string     | null: false |
| delivery_area | string     | null: false |
| delivery_days | string     | null: false |
| price         | integer    | null: false |
| user          | references |             |

### Association
- belongs_to :user
- has_one :buys

## buysテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| credit_number   | text       | null: false |
| expiration      | text       | null: false |
| security_number | integer    | null: false |
| postal_code     | text       | null: false |
| prefecture      | text       | null: false |
| municipality    | text       | null: false |
| address         | text       | null: false |
| building_name   | text       |             |
| phone_number    | integer    | null: false |
| user            | references |             |
| prototype       | references |             |

### Association
- belongs_to :user
- belongs_to :item
