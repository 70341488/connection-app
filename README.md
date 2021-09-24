<h1 align="center">connection-app</h1>

# 自分のお勧めのものの紹介から人と人が繋がれる

# URL https://connectionchat-app.herokuapp.com/

# テスト用アカウント email youfuzhongshan75@gmail.com  password suke4men

# 画像と文章を介して共通点で繋がりチャットでやり取りする

# 人は自分の好きなものを他人に紹介したい欲がある。それを画像と文章で他人に伝え共感して貰う



#テーブル設計

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