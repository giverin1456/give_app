# README

=======
# アプリ名
Give

# 概要
商品の売買ができるECサイトです。  
userがshopを開設することで商品を販売することができます。  
気軽に呟くことができるSTORY機能では、商品の販促を行ったり、user同士コミュニケーションを取ることができます。  
また、気になるuserをフォローしたり、CHATで直接やりとりを行うこともできます。  
気になるuserには直接仕事の依頼を送ることも可能で、アプリ内外問わず活躍できる場を提供しています。

# 本番環境
https://give-app1456.herokuapp.com/

ログイン情報
・Eメール：give.taiki1456@gmail.com
・パスワード：taiki1456

# 制作背景(意図)
新型コロナウィルスの影響で、商品が売れなかったり、離職者が大勢出ている問題を受けて、金銭的な課題を解決したいと思いアプリを開発しました。  

# DEMO
## トップページ
[![Image from Gyazo](https://i.gyazo.com/e12996614a66a34c03f236c97fe24fdd.gif)](https://gyazo.com/e12996614a66a34c03f236c97fe24fdd)
・新着STORYと新着商品が一覧になっています。  
## 新規登録ページ
[![Image from Gyazo](https://i.gyazo.com/4a3ac814091afca6c3cf822e112dcce4.gif)](https://gyazo.com/4a3ac814091afca6c3cf822e112dcce4)  
## 商品出品ページ
[![Image from Gyazo](https://i.gyazo.com/ea52536d6798bc4403e8c032b68c9399.gif)](https://gyazo.com/ea52536d6798bc4403e8c032b68c9399)  
・SHOPを開設していれば、商品を出品することができます。  
・カテゴリー、商品の状態、送料の負担、発送元の地域、発送までの日数はActiveHashで実装しています。  
・価格を入力すると非同期で販売利益の計算をします。
## 商品詳細ページ
[![Image from Gyazo](https://i.gyazo.com/1e755081a4dcbe0f23af6859efc21efa.gif)](https://gyazo.com/1e755081a4dcbe0f23af6859efc21efa)  
・いいねボタンを押すことでuserページのお気に入りのITEMに追加することができます。  
・ショップ、代表、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送日の目安、商品の説明を見ることができます。また、ショップの商品を一覧で見ることができます。
## STORY一覧ページ
[![Image from Gyazo](https://i.gyazo.com/fa0759fd16ca110ea0a2647e94211b2e.gif)](https://gyazo.com/fa0759fd16ca110ea0a2647e94211b2e)  
・userが投稿したSTORYを見ることができます。いいねを押すとお気に入りのSTORYに追加されます。  
・STORYのtextを検索することができます。
## STORY詳細ページ
[![Image from Gyazo](https://i.gyazo.com/40b58aa60fbc8633ca6ebd6f24955836.gif)](https://gyazo.com/40b58aa60fbc8633ca6ebd6f24955836)  
・商品の詳細とコメントを確認することができます。  
・STORYを投稿した本人なら編集、削除することができます。
## SHOP一覧ページ
[![Image from Gyazo](https://i.gyazo.com/a5cce56cbc67db36e847fa2b68bc20b0.gif)](https://gyazo.com/a5cce56cbc67db36e847fa2b68bc20b0)  
・SHOPを一覧できます。SHOP名とカテゴリーごとに検索することができます。
## USERページ
[![Image from Gyazo](https://i.gyazo.com/e8465730012abc272d177281e28357c9.gif)](https://gyazo.com/e8465730012abc272d177281e28357c9)
## CHATページ
[![Image from Gyazo](https://i.gyazo.com/1f0af42292e0fc8927425dcde93e5653.gif)](https://gyazo.com/1f0af42292e0fc8927425dcde93e5653)  
・メッセージのやりとりをしたことがあるuserが一覧になっています。それぞれメッセージのやりとりを行うことができます。
## 通知ページ
[![Image from Gyazo](https://i.gyazo.com/12586b59e917cfa040affea3e5716170.gif)](https://gyazo.com/12586b59e917cfa040affea3e5716170)
・自分が投稿したSTORYにいいねやコメントがついた時、出品した商品にいいねやコメントがついた時、チャットメッセージが届いた時、フォローされた時、コメントした商品、STORYに他userがコメントした時に通知がきます。  
・通知が来たらheaderの通知アイコンにマークがつきます。

# 工夫したポイント
・アプリを作成する段階で、実際にアプリを使ってもらい、様々な人から感想をいただいたことで、userに寄り添ったアプリを作った。
・具体的に何人から、どのような感想→どう生かしたか

# 使用技術(開発環境)
## バックエンド
Ruby,Ruby on Rails 

## フロントエンド
HTML,JavaScript,Ajax

## データベース
MySQL,SequelPro

## インフラ
?????

## Webサーバー(本番環境)
?????

## アプリケーションサーバー(本番環境)
??????

## ソース管理
GitHub,GitHubDesktop

## テスト
Rspec

## エディタ
VScode

# 課題や今後実装したい機能
課題としては、読みやすいコードをかけなかったことです。例えば、誰が見てもわかるclass名をつけられなかったり、簡潔なコードを書けなかったことが挙げられます。  
また、githubをこまめに更新しなかったり、masterにそのまま書きこんでしまった点も課題です。今後はチーム開発を意識した実装を行なっていきたいと思います。


今後実装したい機能としては下記の通りです。
・収支表  
・JSでもっと動きをつけたい  







# DB設計
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
