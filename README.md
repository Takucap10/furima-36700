# README

#　DB 設計

## users table

| Column              | Type    | Options                    |
| ------------------- | ------- | -------------------------- |
| email               | string  | null: false , unique: true |
| encrypted_ password | string  | null: false                |
| name                | string  | null: false                |
| first_name          | string  | null: false                |
| last_name           | string  | null: false                |
| first_name_kana     | string  | null: false                |
| last_name_kana      | string  | null: false                |
| birth_year_id       | integer | null: false                |
| birth_month_id      | integer | null: false                |
| birth_day_idb       | integer | null: 
false                |

### Association
* has_many :items
* has_many :address
* belongs_to :birth_year
* belongs_to :birth_month
* belongs_to :birth_day

## items table

| Column              | Type      | Options                         |
| ------------------- | --------- | ------------------------------- |
| name                | string    | null: false                     |
| information         | text      | null: false                     |
| category_id         | integer   | null: false                     |
| status_id           | integer   | null: false                     |
| prefecture_id       | integer   | null: false                     |
| sending_days_id     | integer   | null: false                     |
| price               | integer   | null: false                     |
| user_id             | reference | null: false , foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :prefecture
- belongs_to :sending_days


# addresses table
| Column              | Type      | Options                         |
| ------------------- | --------- | ------------------------------- |
| post_code           | integer   | null: false                     |
| prefecture_id       | integer   | null: false                     |
| city                | string    | null: false                     |
| block               | string    | null: false                     |
| building            | string    |                                 |
| phone_number        | integer   | null: false                     |
| user_id             | reference | null: false , foreign_key: true |

### Association
- has_one :item
- belongs_to :user
- belongs_to :prefecture

