class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image,            presence: true
  validates :name,             length: { maximum: 40 }, presence: true
  validates :explanation,      length: { maximum: 1000 }, presence: true

  validates :category_id, :condition_id, :delivery_fee_id,
              numericality: { other_than: 1 }, presence: true

  validates :prefecture_id, :shipping_day_id,  
                numericality: { other_than: 0 }, presence: true

  validates :price, 
             numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
             presence: true
end


