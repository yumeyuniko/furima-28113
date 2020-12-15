
<h1 align="center"> Furimaアプリ</h1>

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

* credit-card registration(PayJP)


## ■ Language
### server-side
* Ruby 2.6.5
* 
### front-end


## ■ Flamework
* Ruby on Rails 6.0.0

## ■ Database
* MySQL 5.6.50

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



## usersテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| nickname | string | null:false |
| email | string | null:false　unique:true |
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
   



## itemsテーブル

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



## delivery_destinationsテーブル

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
     




## recordsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user | references |  null: false, foreign_key: true |
| item | references |  null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_destination
     

## sns_credentialsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user | references |  foreign_key: true |
| provider |  |  |
| uid |  |  |


### Association
- belongs_to :user

