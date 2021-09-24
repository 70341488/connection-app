# アプリ名  
# connection-app

# 概要 
## 自分のお勧めのものの紹介から人と人が繋がれて、画像と文章を介して共通点で繋がりチャットでやり取りする

# 本番環境
 ##  url https://connectionchat-app.herokuapp.com/
   
## テスト用アカウント email youfuzhongshan75@gmail.com  password suke4men

# 制作背景 
## 人は自分の好きなものを他人に紹介したい欲がある。それを画像と文章で他人に伝え共感して貰う

# DEMO
## 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/edd108c155d0e387f01a6e5d1b1f5965.gif)](https://gyazo.com/edd108c155d0e387f01a6e5d1b1f5965)
## ログイン機能
[![Image from Gyazo](https://i.gyazo.com/87b6ba21aa8ea4627437683fd30666f9.gif)](https://gyazo.com/87b6ba21aa8ea4627437683fd30666f9)
## チャットルーム作成
[![Image from Gyazo](https://i.gyazo.com/266c52f464a8b21202a8aa5b83a17a08.gif)](https://gyazo.com/266c52f464a8b21202a8aa5b83a17a08)
## チャット機能
[![Image from Gyazo](https://i.gyazo.com/a5a83d18a776cf0c055d2b07f552533b.gif)](https://gyazo.com/a5a83d18a776cf0c055d2b07f552533b)
## マイページ機能 削除削除機能
[![Image from Gyazo](https://i.gyazo.com/2ed7846d875788e866864b4019799121.gif)](https://gyazo.com/2ed7846d875788e866864b4019799121)
# 使用技術(開発環境)
## バックエンド
## Ruby, Ruby on Rails

## フロントエンド
## HTML, CSS, JavaScript,JQuery

## データベース
## MySQL, Sequel Pro

## インフラ
## AWS(S3機能)


## ソース管理
## GitHub,GitHubDesktop

## テスト
## RSpec

## エディタ
## VSCode

# 課題や今後実装したい機能
## レスポンシブデザイン
## エラーメッセージの日本語化
## チャットルームのライン風チャットボット化
## 複数人でのチャット機能


# テーブル設計

# ER図 
![connection](https://user-images.githubusercontent.com/88077407/134621438-6bb8b73d-b67b-49d4-9864-9a89fa35fff2.png)


## users テーブル

| Column                                   | Type           | Options                                      |
| ------------------------------------------ | ---------------- | --------------------------------------------- |
| nickname                                | string          | null: false                                   |
| encrypted_password               | string          | null: false                                   |
| email                                      | string           | null: false, unique: true               |
| birth_date                               | date            | null: false                                   |
| gender                                    | integer        | null: false                                   |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

## rooms テーブル

| Column                                   | Type           | Options                                      |
| ------------------------------------------ | ---------------- | --------------------------------------------- |
| name                                       | string         | null: false                                   |

### Association

- has_many :messages
- has_many :users, through: :room_users
- has_many :room_users

## room_users テーブル

| Column                                   | Type           | Options                                      |
| ------------------------------------------ | ---------------- | --------------------------------------------- |
| user                                        | references  | null: false, foreign_key: true         |
| room                                       | references  | null: false, foreign_key: true         |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column                                   | Type           | Options                                      |
| ------------------------------------------ | ---------------- | --------------------------------------------- |
| user                                       | references   | null: false, foreign_key: true         |
| room                                      | references   | null: false, foreign_key: true        |
| title                                        | string           | null: false                                   |
| prefectures_id                        | integer         |                                                   |
| municipalities                          | string           |                                                   |
| category_id                             | integer         |                                                   |

### Association

- belongs_to :room
- belongs_to :user