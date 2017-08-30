## 作成目的
Ruby on Railsの学習でTwitterを作成

## 基本機能
  * メールアドレスで会員登録
  * 140文字以内で「つぶやき」を投稿
  * フォロー機能
  * いいね！機能
  * 返信機能
  * 検索機能

## 追加機能
Twitterにはない、簡単会話機能を実装

簡単な会話を楽しむことができる
![会話機能](https://user-images.githubusercontent.com/25705890/28839313-2bf9cc70-772e-11e7-8212-cd08944c7a8b.gif)

## DB設計

### users table

| column         | Type        | Option                    |
|:---------------|------------:|:--------------------------|
|  name          | string      | null: false, unique: true |
|  nickname      | string      | null: false               |
|  email         | varchar     | null: false, unique: true |
|  password      | varchar     | null: false,              |
|  introduction  | text        |                           |
|  avatar        | string      |                           |
|  wallpaper     | string      |                           |

#### Association

* has_many : tweets, dependent: :destroy
* has_many :likes
* has_many :like_tweets, through: :likes, source: :tweet
* has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy
* has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
* has_many :following, through: :active_relationships, source: :followed
* has_many :followers, through: :passive_relationships, source: :follower

### tweets tables

| column           | Type        | Option                    |
|:-----------------|------------:|:-------------------------:|
|  content         | text        | null: false               |
|  image           | string      |                           |
|  likes_count     | integer     |                           |
|  reply_nickname  | string      |                           |
|  reply_tweet     | integer     |                           |

#### Association

* belongs_to :user
* has_many :likes, dependent: :destroy

### Relationships table

| column         | Type        | Option                         |
|:---------------|------------:|:------------------------------:|
|  follower_id   | integer     | null: false                    |
|  followed_id   | integer     | null: false                    |

#### Association

* belongs_to :followers, class_name: "User"
* belongs_to :following, class_name: "User"

### likes table

| column     | Type        | Option                         |
|:-----------|------------:|:------------------------------:|
|  user      | string      | null: false, foreign_key: true |
|  tweet     | string      | null: false, foreign_key: true |

#### Association
* belongs_to : user
* belongs_to : tweet, counter_cache: :likes_count
