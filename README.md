# README

<br>

# アプリ名 「Give」
[![Image from Gyazo](https://i.gyazo.com/25f40315d09446b6d797592e18766ab5.jpg)](https://gyazo.com/25f40315d09446b6d797592e18766ab5)

<br>

# 概要
商品の売買ができるECサイトです。  
userがshopを開設することで商品を販売することができます。  
気軽に呟くことができるSTORY機能では、商品の販促を行ったり、user同士コミュニケーションを取ることができます。また、気になるuserをフォローしたり、chatで直接やりとりを行うこともできます。  
気になるuserには直接仕事の依頼を送ることも可能で、アプリ内外問わず活躍できる場を提供できれば良いと考えています。

<br>

# 本番環境
https://give-app1456.herokuapp.com/

### ログイン情報  
- Eメール：give.taiki1456@gmail.com  
- パスワード：taiki1456  

<br>

# 制作背景(意図)
新型コロナウィルスの影響で、商品が売れなかったり、離職者が大勢出ている社会問題を受けて、店舗での販売だけに依存するのではなく、web上で自分の店舗(shop)を作ることが必要だと考えました。  
しかし、大手ECサイトで出品することや個人でサイトを立ち上げるのはハードルが高いと思います。そのため、「大手ECサイトとフリマアプリの中間となるアプリ」を開発しようと考えました。  
そして、同じ目標のuser同士や購入者がアプリ内でコミニュケーションをとり、応援し合う、「Give」の関係を築くことができれば、金銭面、メンタル面ともに充実することができると思い、このアプリを作ることを決めました。  
コロナウィルスに影響を受けている方をはじめ、「自分の商品を届けたい！」「挑戦したい！」と思っている方の背中を押せるアプリを目指しています。

<br>

# DEMO

## トップページ
[![Image from Gyazo](https://i.gyazo.com/e12996614a66a34c03f236c97fe24fdd.gif)](https://gyazo.com/e12996614a66a34c03f236c97fe24fdd)
- 新着STORYと新着商品が一覧になっています。商品名、カテゴリー、配送料、発送日、価格別に検索することができます。  
- ページネーション機能を実装しました。1ページ16件の商品を表示します。
## 新規登録ページ
[![Image from Gyazo](https://i.gyazo.com/4a3ac814091afca6c3cf822e112dcce4.gif)](https://gyazo.com/4a3ac814091afca6c3cf822e112dcce4)  
・user情報を入力すれば登録することができます。user画像は後からでも登録することができます。
## 商品出品ページ
[![Image from Gyazo](https://i.gyazo.com/ea52536d6798bc4403e8c032b68c9399.gif)](https://gyazo.com/ea52536d6798bc4403e8c032b68c9399)  
- SHOPを開設していれば、商品を出品することができます。shopを開設していなければSHOP作成ページに遷移します。  
- カテゴリー、商品の状態、送料の負担、発送元の地域、発送までの日数はActiveHashで実装しています。  
- 価格を入力すると非同期で販売利益の計算を行います。
## 商品詳細ページ
[![Image from Gyazo](https://i.gyazo.com/1e755081a4dcbe0f23af6859efc21efa.gif)](https://gyazo.com/1e755081a4dcbe0f23af6859efc21efa)  
- いいねボタンを押すことで「お気に入りのITEM」に追加することができます。  
- ショップ、代表、カテゴリー、配送料の負担、発送元の地域、発送日の目安、商品の説明を見ることができます。また、販売者のショップ商品を一覧で見ることができます。  
- 商品に対してコメントを書き込むことができます。  
- 出品した本人なら編集、削除することができます。
## STORY一覧ページ
[![Image from Gyazo](https://i.gyazo.com/fa0759fd16ca110ea0a2647e94211b2e.gif)](https://gyazo.com/fa0759fd16ca110ea0a2647e94211b2e)  
- userが投稿したSTORYを見ることができます。いいねを押すとお気に入りのSTORYに追加されます。  
- STORYの文章を検索することができます。  
- STORYを選択すると詳細ページに遷移します。
## STORY詳細ページ
[![Image from Gyazo](https://i.gyazo.com/40b58aa60fbc8633ca6ebd6f24955836.gif)](https://gyazo.com/40b58aa60fbc8633ca6ebd6f24955836)  
- 商品の詳細とコメントを確認することができます。  
- STORYを投稿した本人なら編集、削除することができます。
## SHOP一覧ページ
[![Image from Gyazo](https://i.gyazo.com/a5cce56cbc67db36e847fa2b68bc20b0.gif)](https://gyazo.com/a5cce56cbc67db36e847fa2b68bc20b0)  
- shopを一覧できます。SHOP名とカテゴリーごとに検索することができます。  
- shopを選択するとユーザーページに遷移します。
## USERページ
[![Image from Gyazo](https://i.gyazo.com/e8465730012abc272d177281e28357c9.gif)](https://gyazo.com/e8465730012abc272d177281e28357c9)
- shopの画像とuser画像を表示しています。  
- 自分のshopの情報とSHOPストーリー(どのようなshopなのか)を表示しています。  
- サイドバーでは、お気に入りのSTORYとITEM、購入履歴、売り上げ管理画面、CHATメニュー、お知らせ、ログアウトなどの機能があります。  
- 自分の投稿したSTORYと商品を一覧しています。
## CHATページ
[![Image from Gyazo](https://i.gyazo.com/1f0af42292e0fc8927425dcde93e5653.gif)](https://gyazo.com/1f0af42292e0fc8927425dcde93e5653)  
- メッセージのやりとりをしたことがあるuserが一覧になっています。名前を選択することでそれぞれのチャット画面に遷移します。  
- 自分のメッセージは右側に、相手のメッセージは左側に表示されます。
## 通知ページ
[![Image from Gyazo](https://i.gyazo.com/12586b59e917cfa040affea3e5716170.gif)](https://gyazo.com/12586b59e917cfa040affea3e5716170)
- 自分が投稿したSTORYにいいねやコメントがついた時、出品した商品にいいねやコメントがついた時、チャットメッセージが届いた時、フォローされた時、コメントした商品やSTORYに他userがコメントした時に通知がきます。  
- 通知が来たらheaderの通知アイコンにオレンジ色のマークがつきます。

<br>

# 工夫したポイント
アプリを作成する段階で、様々な職種や年齢の方に実際にアプリを使っていただき、感想や意見をもらいながらアプリを作成しました。  
整体師や会社員、看護師、大学生、実際に店舗で商品を売っている方など17名の方に意見をいただきました。  
その意見の中には、「見た目をシンプルにしたほうが良い」「売れた商品や購入した商品を一覧表示したほうが良い」「通知機能がないと他userの対応ができない」など多くの意見をがあり、いただいた意見を生かして自分では気づかなかった機能を実装することができました。

<br>

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

<br>

# 課題や今後実装したい機能
課題としては、チーム開発を意識して実装することができなかったことです。例えば、誰が見てもわかるclass名をつけていなかったり、読みにくいコードになってしまった点が挙げられます。また、githubをこまめに更新しなかったり、ブランチを複数用意せず、全てmasterブランチに
commitしたことも挙げられます。今後は、以上の点を踏まえてチーム開発を意識した実装を行いたいと思います。  

<br>

今後実装したい機能としては以下の通りです。  

- JavaScriptでアプリに動きをつけたい  
  - 画面サイズの変更によるサイドバーの表示、非表示  
  - いいねボタンを非同期にする。  
  - chat機能で文章を打ち込んだ際非同期にする。  
- ログイン前のトップページにサイトの紹介、説明文を入れる。  
- 商品のカテゴリー多階層にする。  
- 商品、STORY共に複数枚の画像を投稿できるようにする。  
- 商品の売買が行われた後、出品者が商品を発送し、受領するまでの機能。  

<br>

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

<br>

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

<br>

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :registration

<br>

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

<br>

## comments テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| text                 | string     | null: false,                  |
| item                 | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user

<br>

## tweets テーブル

| Column       | Type       | Options                        |
| ------------ | ------     | -----------------------------  |
| text         | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image
- has_many :tweet_comments
- acts_as_likeable
- has_many :notifications, dependent: :destroy

<br>

## tweet_comments テーブル

| Column     | Type       | Options                        |
| ---------- | ------     | -----------------------------  |
| text       | text       | null: false                    |
| tweet      | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet
- has_many :notifications, dependent: :destroy

<br>

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

<br>

## rooms テーブル

| Column            | Type       | Options                        |
| ------------      | ------     | ------------------------       |
| user              | references | null: false, foreign_key: true |

### Association
- has_many :users, through: :room_users
- has_many :room_users, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :notifications, dependent: :destroy

<br>

## room_users テーブル

| Column            | Type       | Options                        |
| ------------      | ------     | ------------------------       |
| room              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user

<br>

## messages テーブル

| Column            | Type       | Options                        |
| ------------      | ------     | ------------------------       |
| text              | text       | null: false                    |
| room              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :notifications, dependent: :destroy

<br>

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

<br>

  ## likes テーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| liker_type        | string     |                              |
| liker_id          | integer    |                              |
| likeable_type     | string     |                              |
| likeable_id       | integer    |                              |

<br>

  ## follows テーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| follower_type     | string     |                              |
| follower_id       | integer    |                              |
| followable_type   | string     |                              |
| followable_id     | integer    |                              |
