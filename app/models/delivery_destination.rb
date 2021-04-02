# == Schema Information
#
# Table name: delivery_destinations
#
#  id            :bigint           not null, primary key
#  building_name :string(255)
#  city          :string(255)      default(""), not null
#  house_number  :string(255)      default(""), not null
#  phone_number  :string(255)      default(""), not null
#  postal_code   :string(255)      default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :integer          not null
#  record_id     :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (record_id => records.id)
#
class DeliveryDestination < ApplicationRecord
  belongs_to :record
end
