# README

## users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name_first         | string  | null: false               |
| name_family        | string  | null: false               |
| name_first_kana    | string  | null: false               |
| name_family_kana   | string  | null: false               |
| birth              | date    | null: false               |

### Association
- has_many :items
- has_many :records


## items table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | string     | null: false                    |
| explain            | text       | null: false                    |
| delivery_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_many :records

- has_one_attached :image


## orders table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| zip_code           | integer    | null: false                    |
| province           | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building           | string     |                                |
| telephone          | integer    | null: false                    |
| record             | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- has_many :records


## records table

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | integer    | null: false, foreign_key: true |
| item               | integer    | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- belongs_to :order

