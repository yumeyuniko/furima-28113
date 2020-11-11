
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
| first_name_ruby | string | null:false |
| last_name_ruby | string | null:false |
| birthday | string | null:false |

### Association
 - has_many :item   
 - has_many :record
   



## itemsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| user_id | references | null:false |
| category | string | null:false |
| condition | string | null:false |
| delivery_fee | integer | null:false |
| shipping_area | string | null:false |
| shipping_day | string | null:false |
| price | integer | null:false |
| favorite |  |  |
 ### Association
 - belongs_to :user
 - has_one :record



## delivery_destinationsテーブル

| Column | Type | Options |
| :--- | :---: | ---: |
| postal_code | integer(7) | null:false |
| prefecture  | string | null:false |
| city | string | null:false |
| house_number | string | null:false |
| building_name | string |  |
| phone_number | integer | null:false |
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