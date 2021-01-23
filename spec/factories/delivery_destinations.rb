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
FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜' }
    house_number { '青山1-1' }
    phone_number { '09011112222' }
    token { 'aaaa658haaavirjvz344dkefd' }
  end
end
