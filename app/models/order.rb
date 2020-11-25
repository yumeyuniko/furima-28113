class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:item_id,:user_id, :token
  
 


  with_options presence: true do
    # 郵便番号に関するバリデーション
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/, message: " input correctly"}
    # 都道府県に関するバリデーション
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "input only number"}

    validates :token
  end

    



  def save
        # 購入商品を保存
        record = Record.create!(item_id: item_id, user_id: user_id)
        # 配送先住所の情報を保存
        DeliveryDestination.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, 
                                   house_number: house_number, building_name: building_name, phone_number: phone_number, 
                                      record_id: record.id)
      end
  end

