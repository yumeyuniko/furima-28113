FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    first_name {"阿部"}
    last_name {"優子"}
    first_name_kana {"アベ"}
    last_name_kana {"ユウコ"}
    birthday {Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end