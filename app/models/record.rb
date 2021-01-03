class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :delivery_destination, dependent: :destroy #追記
end
