class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_one :record
    has_many :item_tag_relations
    has_many :tags, through: :item_tag_relations

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :delivery_fee
    belongs_to :prefecture
    belongs_to :shipping_day
    
    has_many :comments  # commentsテーブルとのアソシエーション


    with_options presence: true do
      
    validates :image
    validates :name,             length: { maximum: 40 }
    validates :explanation,      length: { maximum: 1000 }
    validates :category_id, :condition_id, :delivery_fee_id,
                numericality: { other_than: 0 }
    validates :prefecture_id, :shipping_day_id,  
                  numericality: { other_than: 0 }
    validates :price, 
               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    end

    # with_options ************ {*******} do
        
    # end
end


