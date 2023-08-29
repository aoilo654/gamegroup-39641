# アプリケーション名

GAMEGROUP

# アプリケーション概要

ユーザー同士のゲーム情報をシェアすることで、コミュニケーションを取りやすくすることができる

# URL

https://gamegroup-39641.onrender.com

# テスト用アカウント

・Basic認証パスワード：2222  
・Basic認証ID：admin  
・メールアドレス：test@test.com  
・パスワード：test111  

# 利用方法

## ゲームのプレイヤー情報入力

1.ヘッダーからユーザー新規登録を行う  
2.画面中央のメインコンテンツのタブから、ゲームを選ぶ  
3.左のサイドバーに出現するゲーム情報登録ボタンから、プレイヤー情報（推しキャラorプレイヤー画像・プレイヤー名・RANK・クラン名・プレイスタイル）を入力する


# アプリケーションを作成した背景

自身の経験から、別のゲームに移行した際、プレイヤー間の関係構築の作りずらさを感じることが多々あった。分析した結果、ゲーム内のコミュニケーションツールの違いや、情報共有がゲーム内のことでしかないことが原因であると仮説を立てた。原因を解決するため、ユーザー同士の他のゲーム情報の出来るようにし、コミュニケーションを促進できるアプリケーションを開発することにした。

# 実装予定の機能

現在、ツイート機能を実装中。
今後はユーザー検索機能を実装予定。

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