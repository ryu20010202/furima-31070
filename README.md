# テーブル設計

## usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| lname      | string | null: false |
| fname      | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column     | Type          | Options     |
| ---------- | ------------- | ----------- |
| item_name  | string        | null: false |
| item_text  | text          | null: false |
| category   | string        | null: false |
| condition  | string        | null: false |
| burden     | string        | null: false |
| area       | string        | null: false |
| day        | string        | null: false |
| price      | string        | null: false |
| image      | ActiveStorage |             |
| user       | references    |             |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## commentsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :user
- belongs_to :item

## ordersテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| card_number  | string     | null: false |
| time_limit   | string     | null: false |
| card_code    | string     | null: false |
| postal_cord  | string     | null: false |
| prefectures  | string     | null: false |
| municipality | string     | null: false |
| house_number | string     | null: false |
| building     | string     |             |
| phone_number | string     | null: false |
| user         | references |             |
| item         | references |             |

### Association

- belongs_to :user
- belongs_to :item
