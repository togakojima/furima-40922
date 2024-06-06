# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| name_kanji         | string | null: false |
| name_kana          | string | null: false |
| birth              | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| title        | string     | null: false |
| info         | text       | null: false |
| category     | integer    | null: false |
| status       | integer    | null: false |
| shipping_fee | integer    | null: false |
| region       | integer    | null: false |
| schedule     | integer    | null: false |
| price        | integer    | null: false |
| user         | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postcode      | integer    | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_num     | string     | null: false |
| building_name | string     |             |
| tel_num       | string     | null: false |

### Association

- has_one :purchase