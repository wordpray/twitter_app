# 作成目的
Ruby on Railsの勉強でTwitterを作成します。

# ホーム画面
![ホーム画面](https://user-images.githubusercontent.com/25705890/28626282-88d2e64a-7259-11e7-932d-5551b4936dfe.png)

# 要件定義｜機能
  * メールアドレスで会員登録
  * 140文字以内で「つぶやき」を投稿できる
  * フォロー機能
  * 「つぶやき」をいいね！できる
  * Tweetに返信機能

# DB設計

## users table

| column         | Type        | Option                    |
|:---------------|------------:|:--------------------------|
|  name          | string      | null: false, unique: true |
|  nickname      | string      | null: false               |
|  email         | varchar     | null: false, unique: true |
|  password      | varchar     | null: false,              |
|  introduction  | text        |                           |
|  avatar        | string      |                           |
|  wallpaper     | string      |                           |

### Association

* has_many : tweets, dependent: :destroy
* has_many :likes
* has_many :like_tweets, through: :likes, source: :tweet
* has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy
* has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
* has_many :following, through: :active_relationships, source: :followed
* has_many :followers, through: :passive_relationships, source: :follower

## tweets tables

| column           | Type        | Option                    |
|:-----------------|------------:|:-------------------------:|
|  content         | text        | null: false               |
|  image           | string      |                           |
|  likes_count     | integer     |                           |
|  reply_nickname  | string      |                           |
|  reply_tweet     | integer     |                           |

### Association

* belongs_to :user
* has_many :likes, dependent: :destroy

## Relationships table

| column         | Type        | Option                         |
|:---------------|------------:|:------------------------------:|
|  follower_id   | integer     | null: false                    |
|  followed_id   | integer     | null: false                    |

### Association

* belongs_to :followers, class_name: "User"
* belongs_to :following, class_name: "User"

## likes table

| column     | Type        | Option                         |
|:-----------|------------:|:------------------------------:|
|  user      | string      | null: false, foreign_key: true |
|  tweet     | string      | null: false, foreign_key: true |

### Association
* belongs_to : user
* belongs_to : tweet, counter_cache: :likes_count
