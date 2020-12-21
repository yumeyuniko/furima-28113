
<h1 align="center"> Manecari</h1>

- メルカリクローンのフリーマーケットサイト


<img src="images/../app/assets/images/manecari.gif" width="500px;" />
<img src="images/../app/assets/images/manecari1.gif" width="500px;" />

## :paperclip: 主な使用言語
<a><img src="images/../app/assets/images/ruby.png" width="70px;" /></a> <!-- rubyのロゴ -->
<a><img src="images/../app/assets/images/rails.png" width="200px;" /></a> <!-- railsロゴ -->

<br>

# :page_facing_up: DB設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/0ccc44629dd5ee466c92ae70cbbdd123.png)](https://gyazo.com/0ccc44629dd5ee466c92ae70cbbdd123)

## ■ Summary


## ■ Function
* FacebookとGoogleのSNSアカウントを使ってログインできる
* 外部のストレージサービスS3を使って画像の保存ができる
* ユーザは出品商品に対してコメントができ、削除ができる
* 新規商品出品の際、画像のプレビューができる
* 新規商品出品の際にタグ付けができる
* パンくずリスト設置
* 商品編集・削除後メッセージが表示される
* ログイン・ログアウト時にメッセージが表示される
* ユーザはお問合せフォームからお問合せができる
* フォームの入力不備があれば、日本語でエラーメッセージ が表示される

* ファビコン設定で、ブラウザのタブにアイコンが表示される
* スマホのホーム画面にサイトのショートカットアイコンを表示




## ■ Language
### server-side
* Ruby 2.6.5
  



## ■ Flamework
* Ruby on Rails 6.0.0

## ■ Database
* 5.5.68-MariaDB

## ■ Infrastructure
* AWS EC2
* AWS S3

## ■ Deploy
* automated deployment by capistrano


|入力内容 | 備考 | 
| :--- | :---: | 
| フリマアプリのURL | http://52.196.164.12/ | 
| Basic認証のIDとパスワード| ID:admin  / password:2222 | 
| 出品者用のメールアドレスとパスワード| :e-mail: sample@gmail.com   :key:111aaa | 
| 購入者用のメールアドレスとパスワード| :e-mail: sample1@gmail.com   :key:111aaa | 
|購入用カードの番号・期限・セキュリティコード| カード番号 :4242424242424242 |  
|セキュリティコード|CVC: 123|  
|有効期限|登録時より未来|  



## ① usersテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| nickname | string | null:false |
| email | string | null:false unique:true |
| encrypted_password | string | null:false |
| first_name | string | null:false |
| last_name | string | null:false |
| first_name_kana | string | null:false |
| last_name_kana | string | null:false |
| birthday | date| null:false |

### Association
 - has_many :items
 - has_many :records
 - has_many :sns_credentials
 - has_many :comments
   



## ②itemsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user | references | null: false, foreign_key: true |
| name | string | null:false |
| explanation | text | null:false |
| category_id | integer | null:false |
| condition_id | integer | null:false |
| delivery_fee_id | integer | null:false |
| prefecture_id | integer | null:false |
| shipping_day_id | integer | null:false |
| price | integer | null:false |

 ### Association
 - belongs_to :user
 - has_one :record
 - has_many :item_tag_relations
 - has_many :comments
 - has_many :tags



## ③delivery_destinationsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| postal_code | string | null:false |
| prefecture_id | integer | null:false |
| city | string | null:false |
| house_number | string | null:false |
| building_name | string |  |
| phone_number | string | null:false |
| record | references | null: false, foreign_key: true |
 ### Association
- belongs_to :record
     




## ④recordsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user | references |  null: false, foreign_key: true |
| item | references |  null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_destination
     

## ⑤sns_credentialsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user | references |  foreign_key: true |
| provider | string |  |
| uid | string |  |


### Association
- belongs_to :user  





## ⑥commentsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| text | text |   |
| user | references |  null:false, foreign_key: true |
| item | references |  null:false, foreign_key: true |


### Association
-   belongs_to :item 
-   belongs_to :user 





## ⑦item_tag_relationsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| tag_name | string |  null:false, uniqueness: true |


### Association
- belongs_to :item
- belongs_to :tag
  


## ⑧tagsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| item | references |  foreign_key: true |
| tag | references |  foreign_key: true |


### Association
-  has_many :item_tag_relations
-  has_many :items
