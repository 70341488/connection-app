#connection-app

##自分のお勧めのものの紹介から人と人が繋がれる

###URL

###テスト用アカウント

###画像と文章を介して共通点で繋がりチャットでやり取りする

###人は自分の好きなものを他人に紹介したい欲がある。それを画像と文章で他人に伝え共感して貰う

|機能                                                 |目的                                               |
|ユーザー管理機能	                              |ユーザーの管理                                 |
|マイページ機能                                   |自己紹介                                          |
|投稿機能	                                           |自分のおすすめを紹介                        |
|チャット機能	                                     |チャットでやり取り                           |
|各ルームの背景、デザイン	                   |各ルームの見栄えを良くする                |
|テーブル設計	                                     |保存するカラムの設定                         |
|チャットルームの非同期通信	                |読み込みなくチャットが出来るように    |
|通知機能	                                           |通知があったことがわかるようにする    |
|S3機能実装	                                       |画像が時間経過で消えない様にする       |
|いいね機能実装	                                  |投稿したものが評価される                   |
|トップページのアニメーション設定	       |トップページの見た目を良くする           |
|画像の複数枚投稿	                               |多くの画像情報をユーザーが投稿出来る |


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