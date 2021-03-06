# アプリ名  
# connection-app

# 概要 
## 自分のお勧めのものの紹介から人と人が繋がれて、画像と文章を介して共通点で繋がりチャットでやり取りする。

# 本番環境
##  url https://connectionchat-app.herokuapp.com/

## テスト用アカウント email youfuzhongshan75@gmail.com  password suke4men

# 制作背景 
## 自分が他人に勧めたいと思うものを投稿して、同じものが好きな人と人が繋がりを持ったコミュニティを作りやり取り出来るチャットアプリ。それにより紹介された物を買ったり体験したりして消費行動を起こさせる。紹介するジャンルとしては、旅先、食事、趣味、体験などを写真と説明文、また都道府県や都市を記述することで場所も紹介できる。

# DEMO
## 新規登録画面
<img src="app/assets/images/edd108c155d0e387f01a6e5d1b1f5965.gif">

## nickname, Email, Password, Password confirmation, Birth date, Genderを入力すると新規登録できる。

## ログイン機能
<img src="app/assets/images/87b6ba21aa8ea4627437683fd30666f9.gif">

## EmailとPasswordを入力してログインできる。

## チャットルーム作成
<img src="app/assets/images/266c52f464a8b21202a8aa5b83a17a08.gif">

## チャットルーム名とチャットメンバー名を選択してチャットルームを作成する。

## チャット機能
<img src="app/assets/images/a5a83d18a776cf0c055d2b07f552533b.gif">

## 文章、ジャンル、必要なら都道府県名と都市名、画像を入力して送信すると非同期通信でチャットができる。画像は送信前にプレビューできる。

## マイページ機能 削除削除機能
<img src="app/assets/images/a5a83d18a776cf0c055d2b07f552533b.gif">

## マイページで自分が投稿したものをみることが出来る。チャットルームを削除すると結びつく投稿内容も全て削除される。 

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

# ポイント
## チャットルームの非同期通信
### チャットのやり取りがスムーズに出来るようにするために使用した。

## 画像送信前のプレビュー機能
### 自分の意図しない画像の送信を防ぎ、チャット画面にどの様に送信されるか防ぐため。

## ログイン前のアニメーション
### 機能、実装ともにシンプルなのでアプリのコンセプトの強調に使用した。


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