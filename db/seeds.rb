# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    nickname: "テスト太郎#{n + 1}",
    first_name: "太郎#{n + 1}",
    last_name: "テスト#{n + 1}",
    first_name_kana: "タロウ",
    last_name_kana: "テスト",
    birthday: "1931-01-#{n + 1}",
    password: "111aaa"
  )
end