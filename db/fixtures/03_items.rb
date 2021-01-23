users = User.where(id: 2..5)
names = ["りんご","フルーツ","パイナップル","盛り合わせ","桃","チェリー"]
explanations= ["美味しいりんご","美味しいフルーツ","美味しいパイナップル","豪華な盛り合わせ","甘い桃","可愛いチェリー"]
delivery_fees_id = [1, 2 ,2, 1, 2]
shipping_days_id = [1, 2, 3, 1,2]
prices = [1000, 2000, 3000,4000,5000]

5.times do |n|
  name = names[n]
  explanation = explanations[n]
  delivery_fee_id = delivery_fees_id[n]
  shipping_day_id = shipping_days_id[n]
  price = prices[n]
  item = Item.new(
    user: users.sample,
    name: "#{name}",
    explanation: "#{explanation}",
    category_id: n + 1,
    condition_id: n + 1,
    delivery_fee_id: delivery_fee_id,
    prefecture_id: n + 1,
    shipping_day_id: shipping_day_id,
    price: price,
    image: item
  )
  item.image.attach(io: File.open("#{Rails.root}/db/sample/item#{n +1}.png"), filename:  "item#{n +1}.png")
  item.save!
end


item = Item.new(
  user_id: 1,
  name: "イラスト",
  explanation: "イラスト",
  category_id: 1,
  condition_id: 1,
  delivery_fee_id: 1,
  prefecture_id: 1,
  shipping_day_id: 1,
  price: 2000,
  image: item
)
item.image.attach(io: File.open("#{Rails.root}/db/sample/sample1.jpg"), filename:  "sample1.jpg")
item.save!
