# README

## users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_first         | string | null: false               |
| name_family        | string | null: false               |
| name_first_kana    | string | null: false               |
| name_family_kana   | string | null: false               |
| birth_year         | select |                           |
| birth_month        | select |                           |
| birth_day          | select |                           |

### Association
- has_many :items


## items table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| goods              | text       | null: false                    |
| explain            | text       | null: false                    |
| category           | select     |                                |
| condition          | select     |                                |
| shipping           | select     |                                |
| shipping_region    | select     |                                |
| shipping_date      | select     |                                |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image
- has_one_attached :order


## order table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | string     | null: false                    |
| card_date          | string     | null: false                    |
| card_code          | string     | null: false                    |
| zip_code           | string     | null: false                    |
| province           | select     |                                |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building           | string     |                                |
| telephone          | string     | null: false                    |
| item               | references | null: false, foreign_key: true |

## Association
- belongs_to :items