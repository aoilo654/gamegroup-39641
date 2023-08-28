# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association

has_many :games
has_many :comments
has_many :game_tweets

## games テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| game_title_id      | integer    | null: false                    |
| player_name        | string     |                                |
| rank               | integer    |                                |
| clan               | string     |                                |
| playstyle          | text       |                                |
| user               | references | null: false, foreign_key: true |

### Association

has_one  :invitation
belongs  :game_title

## invitations テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| code               | text       | null: false                    |
| count              | integer    |                                |
| game               | references | null: false, foreign_key: true |

### Association

belongs_to :game

## game_tweets テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| tweet         | text       | null: false                    |
| game_title_id | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :game_title

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| comment       | text       | null: false                    |
| game_tweet    | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

belongs_to :game_tweet
belongs_tp :user