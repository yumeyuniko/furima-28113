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
class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_one :record
    has_many :item_tag_relations,dependent: :destroy

    has_many :tags, through: :item_tag_relations #,dependent: :destroy  tagを残すため


    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_fee
    belongs_to :prefecture
    belongs_to :shipping_day
    
    has_many :comments, dependent: :destroy
    # commentsテーブルとのアソシエーション


    with_options presence: true do
      
    validates :image
    validates :name,             length: { maximum: 40 }
    validates :explanation,      length: { maximum: 1000 }
    validates :category_id, :condition_id, :delivery_fee_id,
                numericality: { other_than: 0, message: "を選択してください"  }
    validates :prefecture_id, :shipping_day_id,  
                  numericality: { other_than: 0, message: "を選択してください"  }
    validates :price, 
               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "を半角数字で入力してください"  }
    end

    # with_options ************ {*******} do
        
    # end
end


