# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# # ユーザデータ
# user_array=["イチ","ニ","サン","ヨン","ゴ"]
# 5.times do |n|
#   i = user_array[n].chomp
#   User.create!(
#     email: "test#{n + 1}@test.com",
#     nickname: "テスト太郎#{n + 1}",
#     first_name: "太郎#{n + 1}",
#     last_name: "テスト#{n + 1}",
#     first_name_kana: "タロウ#{i}",
#     last_name_kana: "テスト#{i}",
#     birthday: "1931-01-#{n + 1}",
#     password: "111aaa"
#   )
# end

# #タグデータ
# tag_array=["Ruby","Program","学習","112",123]
# 5.times do |n|
#   i = tag_array[n]
#   Tag.create!(
#     tag_name: "#{i}",
#   )
# end


# #アイテムデータ
# users = User.all
# names = ["りんご","フルーツ","パイナップル","盛り合わせ","桃","チェリー"]
# explanations= ["美味しいりんご","美味しいフルーツ","美味しいパイナップル","豪華な盛り合わせ","甘い桃","可愛いチェリー"]
# delivery_fees_id = [1, 2 ,2, 1, 2]
# shipping_days_id = [1, 2, 3, 1,2]
# prices = [1000, 2000, 3000,4000,5000]

# 5.times do |n|
#   name = names[n]
#   explanation = explanations[n]
#   delivery_fee_id = delivery_fees_id[n]
#   shipping_day_id = shipping_days_id[n]
#   price = prices[n]
#   item = Item.new(
#     user: users[n],
#     name: "#{name}",
#     explanation: "#{explanation}",
#     category_id: n + 1,
#     condition_id: n + 1,
#     delivery_fee_id: delivery_fee_id,
#     prefecture_id: n + 1,
#     shipping_day_id: shipping_day_id,
#     price: price,
#     image: item
#   )
#   item.image.attach(io: File.open("#{Rails.root}/db/sample/item#{n +1}.png"), filename:  "item#{n +1}.png")
#   item.save!
# end


# item = Item.new(
#   user_id: 1,
#   name: "イラスト",
#   explanation: "イラスト",
#   category_id: 1,
#   condition_id: 1,
#   delivery_fee_id: 1,
#   prefecture_id: 1,
#   shipping_day_id: 1,
#   price: 2000,
#   image: item
# )
# item.image.attach(io: File.open("#{Rails.root}/db/sample/sample1.jpg"), filename:  "sample1.jpg")
# item.save!



# #購入履歴データ
# 3.times do |n|
#   Record.create!(
#     user_id: "#{n + 1}",
#     item_id: "#{n + 1}",
#   )
# end

# # コメントデータ
# 5.times do |n|
#   Comment.create!(
#     text: "コメント#{n + 1 }",
#     user_id: n + 1,
#     item_id: n + 1,
#   )
# end

# User.all.each do |user|
#   user.comments.create!(
#     text: 'コメントの返事',
#     item_id: 1,
#   )
# end

# Comment.create!(
#   text: "ありがとう",
#   user_id: 1,
#   item_id: 6,
# )

# Comment.create!(
#   text: "ありがとう2",
#   user_id: 2,
#   item_id: 6,
# )