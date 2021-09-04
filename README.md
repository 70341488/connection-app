<h1 align="center">connection-app</h1>

<h2>自分のお勧めのものの紹介から人と人が繋がれる</h2>

<h3>URL</h3>

<h3>テスト用アカウント<h3>

<h3>画像と文章を介して共通点で繋がりチャットでやり取りする</h3>

<h3>人は自分の好きなものを他人に紹介したい欲がある。それを画像と文章で他人に伝え共感して貰う</h3>



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
| category_id                             | integer        | null: false                                   |

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
| explanation                             | text             | null: false                                    |
| prefectures_id                        | integer         |                                                   |
| municipalities                          | string           |                                                   |
| category_id                             | integer         | null: false                                    |

### Association

- belongs_to :room
- belongs_to :user