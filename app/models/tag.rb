class Tag < ApplicationRecord
  has_many :item_tag_relations, dependent: :destroy #追記
  has_many :items, through: :item_tag_relations, dependent: :destroy #追記

  validates :tag_name, uniqueness: true
end
