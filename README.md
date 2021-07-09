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

## itemsテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| information      | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| shipping_id      | integer    | null: false       |
| area_id          | integer    | null: false       |
| days_id          | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :buy

## buysテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses  テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| area_id         | integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| buy             | references | foreign_key: true |

### Association
- belongs_to :buy