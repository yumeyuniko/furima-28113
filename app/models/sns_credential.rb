# == Schema Information
#
# Table name: sns_credentials
#
#  id         :bigint           not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true
end
