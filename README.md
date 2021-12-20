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
* has_many :sending_logs

## items_table

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| name                | string     | null: false                     |
| information         | text       | null: false                     |
| category_id         | integer    | null: false                     |
| status_id           | integer    | null: false                     |
| postage_id          | integer    | null: false                     |
| prefecture_id       | integer    | null: false                     |
| sending_days_id     | integer    | null: false                     |
| price               | integer    | null: false                     |
| user                | references | null: false , foreign_key: true |

### Association
- has_one :sending_log
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :prefecture
- belongs_to :sending_days


# sending_addresses_table
| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| post_code           | string     | null: false                     |
| prefecture_id       | integer    | null: false                     |
| city                | string     | null: false                     |
| block               | string     | null: false                     |
| building            | string     |                                 |
| phone_number        | string     | null: false                     |
| sending_log         | references | null: false , foreign_key: true |


### Association
- belongs_to :sending_log

# sending_logs_table

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| user                | references | null: false , foreign_key: true |
| item                | references | null: false , foreign_key: true |

### Association
- has_one :sending_address
- belongs_to :user
- belongs_to :item
