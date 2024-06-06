# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false |
| firstname_kanji    | string  | null: false |
| lastname_kanji     | string  | null: false |
| firstname_kana     | string  | null: false |
| lastname_kana      | string  | null: false |
| birthday           | date    | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| title         | string     | null: false |
| info          | text       | null: false |
| category_id   | integer    | null: false |
| status_id     | integer    | null: false |
| fee_id        | integer    | null: false |
| prefecture_id | integer    | null: false |
| schedule_id   | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false, foreign_key: true |

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
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postcode      | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| house_num     | string     | null: false |
| building_name | string     |             |
| tel_num       | string     | null: false |
| purchase      | references | null; false, foreign_key: true |

### Association

- belongs_to :purchase