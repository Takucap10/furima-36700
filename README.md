# README

#　DB 設計

## users_table

| Column              | Type    | Options                    |
| ------------------- | ------- | -------------------------- |
| email               | string  | null: false , unique: true |
| encrypted_ password | string  | null: false                |
| name                | string  | null: false                |
| first_name          | string  | null: false                |
| last_name           | string  | null: false                |
| first_name_kana     | string  | null: false                |
| last_name_kana      | string  | null: false                |
| birth_day           | date    | null: false                |


### Association
* has_many :items
* has_many :orders

## items_table

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| name                | string     | null: false                     |
| information         | text       | null: false                     |
| category_id         | integer    | null: false                     |
| status_id           | integer    | null: false                     |
| postage_id          | integer    | null: false                     |
| prefecture_id       | integer    | null: false                     |
| sending_day_id      | integer    | null: false                     |
| price               | integer    | null: false                     |
| user                | references | null: false , foreign_key: true |

### Association
- has_one :order
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :prefecture
- belongs_to :sending_day


# addresses_table
| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| post_code           | string     | null: false                     |
| prefecture_id       | integer    | null: false                     |
| city                | string     | null: false                     |
| block               | string     | null: false                     |
| building            | string     |                                 |
| phone_number        | string     | null: false                     |
| order               | references | null: false , foreign_key: true |


### Association
- belongs_to :order

# order_table

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| user                | references | null: false , foreign_key: true |
| item                | references | null: false , foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item
