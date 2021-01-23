# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  tag_name   :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :item_tag_relations, dependent: :destroy #追記
  has_many :items, through: :item_tag_relations, dependent: :destroy #追記

  validates :tag_name, uniqueness: true
end
