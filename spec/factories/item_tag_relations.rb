# == Schema Information
#
# Table name: item_tag_relations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint
#  tag_id     :bigint
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (tag_id => tags.id)
#
FactoryBot.define do
  factory :item_tag_relation do
    
  end
end
