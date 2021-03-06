# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint           not null
#  user_id    :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :item  # itemsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

  validates :text, presence: true
end
