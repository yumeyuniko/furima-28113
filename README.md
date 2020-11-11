
<h1 align="center"> Furimaアプリ</h1>

- メルカリクローンのフリーマーケットサイト

- ![top_page](https://gyazo.com/a4db61709d44f73746dba48bafe0b8cf/raw)


## :paperclip: 主な使用言語
<a><img src="images/../app/assets/images/ruby.png" width="70px;" /></a> <!-- rubyのロゴ -->
<a><img src="images/../app/assets/images/rails.png" width="200px;" /></a> <!-- railsロゴ -->

<br>

# :page_facing_up: DB設計

## ER図
![er](https://gyazo.com/64f6b786f2b929a546cd16fb82e5574f/raw)

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
 - has_many :item   
 - has_many :record
   



## itemsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user_id | references | null:false |
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
| postal_code | integer(7) | null:false |
| prefecture_id | integer | null:false |
| city | string | null:false |
| house_number | string | null:false |
| building_name | string |  |
| phone_number | integer | null:false |
| record_id | references |  null: false, foreign_key: true |
 ### Association
- belongs_to :record
     




## recordsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user_id | references |  null: false, foreign_key: true |
| item_id | references |  null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_destination