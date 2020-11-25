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
