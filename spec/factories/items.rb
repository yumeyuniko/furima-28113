FactoryBot.define do
  factory :item do
      name {"テスト"}
      explanation {"衣類"}
      category_id {2}
      condition_id {2}
      delivery_fee_id {3}
      prefecture_id {4}
      shipping_day_id {5}
      price {34568}
      association :user
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
