# README

## users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nick_name          | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth              | date    | null: false               |

### Association
- has_many :items
- has_many :orders


## items table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | string     | null: false                    |
| explain            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_id        | integer    | null: false                    |
| province_id        | integer    | null: false                    |
| start_id           | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

- has_one_attached :image


## orders table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address


## address table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip_code           | string     | null: false                    |
| province_id        | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building           | string     |                                |
| telephone          | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

## Association
- belongs_to :order

