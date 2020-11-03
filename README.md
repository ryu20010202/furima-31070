# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| lname              | string | null: false |
| fname              | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column       | Type          | Options           |
| ------------ | ------------- | ----------------- |
| name         | string        | null: false       |
| text         | text          | null: false       |
| category_id  | integer       | null: false       |
| condition_id | integer       | null: false       |
| burden_id    | integer       | null: false       |
| area_id      | integer       | null: false       |
| day_id       | integer       | null: false       |
| price        | integer       | null: false       |
| image        | ActiveStorage |                   |
| user         | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| postal_cord  | string     | null: false       |
| prefectures  | string     | null: false       |
| municipality | string     | null: false       |
| house_number | string     | null: false       |
| building     | string     |                   |
| phone_number | string     | null: false       |

### Association

- belongs_to :order
