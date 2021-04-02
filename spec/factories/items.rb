# == Schema Information
#
# Table name: items
#
#  id              :bigint           not null, primary key
#  explanation     :text(65535)      not null
#  name            :string(255)      not null
#  price           :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          not null
#  condition_id    :integer          not null
#  delivery_fee_id :integer          not null
#  prefecture_id   :integer          not null
#  shipping_day_id :integer          not null
#  user_id         :bigint           not null
#
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
