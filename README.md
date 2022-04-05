# README

#アプリ名



# テーブル設計


## users テーブル

| Column              | Type   | Options                  |
| ------------------  | ------ | ------------------------ |
| nickname            | string | null: false              |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_kana          | string | null: false              |
| last_kana           | string | null: false              |
| email               | string | null: false ,unique: true|
| encrypted_password  | string | null: false              |
| birthday            | date   | null: false              |

### Association
- has_many :items
- has_many :orders
- has_many :comments
- has_many :tweets
- has_many :tweet_comments
- has_one_attached :image
- acts_as_liker
- acts_as_follower
- acts_as_followable
- has_one :shop
- has_many :messages, dependent: :destroy
- has_many :rooms, through: :room_users
- has_many :room_users, dependent: :destroy
- has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
- has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy




## items テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| item_name           | text          | null: false                    |
| category_id         | integer       | null: false                    |
| status_id           | integer       | null: false                    |
| delivery_charge_id  | integer       | null: false                    |
| prefecture_id       | integer       | null: false                    |
| day_id              | integer       | null: false                    |
| price               | integer       | null: false                    |
| user                | references    | null: false, foreign_key: true |

### Association
- has_one_attached :image
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :day
- belongs_to :user
- belongs_to :shop, optional: true
- has_one :order
- has_many :comments
- acts_as_likeable
- has_many :notifications, dependent: :destroy





## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :registration




## registrations テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| postal_code          | string     | null: false,                  |
| prefecture_id        | integer    | null: false,                  |
| city                 | string     | null: false,                  |
| house_number         | string     | null: false,                  |
| building             | string     |                               |
| phone_number         | string     | null: false,                  |
| order                | references | null: false,foreign_key:true  |

### Association
- belongs_to :order




## comments テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| text                 | string     | null: false,                  |
| item                 | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user




## tweets テーブル

| Column       | Type       | Options                  |
| ------------ | ------     | ------------------------ |
| text         | text       | null: false              |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image
- has_many :tweet_comments
- acts_as_likeable
- has_many :notifications, dependent: :destroy





## tweet_comments テーブル

| Column     | Type       | Options                        |
| ---------- | ------     | ------------------------       |
| text       | text       | null: false                    |
| tweet      | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet
- has_many :notifications, dependent: :destroy





## shops テーブル

| Column            | Type       | Options                        |
| ------------      | ------     | ------------------------       |
| name              | spring     | null: false                    |
| text              | text       | null: false                    |
| shop_category_id  | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to_active_hash :shop_category
- belongs_to :user
- has_many :items
- belongs_to_active_hash :prefecture
- has_one_attached :image





## rooms テーブル

| Column            | Type       | Options                        |
| ------------      | ------     | ------------------------       |
| user              | references | null: false, foreign_key: true |

### Association
- has_many :users, through: :room_users
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :notifications, dependent: :destroy





## room_users テーブル

| Column            | Type       | Options                        |
| ------------      | ------     | ------------------------       |
| room              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user





  ## mmessages テーブル

| Column            | Type       | Options                        |
| ------------      | ------     | ------------------------       |
| text              | text       | null: false                    |
| room              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :notifications, dependent: :destroy





  ## notifications テーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| visitor_id        | integer    | null: false,                 |
| visited_id        | integer    | null: false,                 |
| tweet_id          | integer    |                              |
| tweet_comment_id  | integer    |                              |
| item_id           | integer    |                              |
| comment_id        | integer    |                              |
| message_id        | integer    |                              |
| room_id           | integer    |                              |
| action            | string     | default: '', null: false     |
| checked           | boolean    | null: false, default: false  |

### Association
- belongs_to :tweet, optional: true
- belongs_to :tweet_comment, optional: true
- belongs_to :comment, optional: true
- belongs_to :message, optional: true
- belongs_to :room, optional: true
- belongs_to :item, optional:true
- belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true



  ## likes テーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| liker_type        | string     |                              |
| liker_id          | integer    |                              |
| likeable_type     | string     |                              |
| likeable_id       | integer    |                              |




  ## follows テーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| follower_type     | string     |                              |
| follower_id       | integer    |                              |
| followable_type   | string     |                              |
| followable_id     | integer    |                              |
