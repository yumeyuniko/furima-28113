User.seed do |s|
  s.id              = 1
  s.email           = 'test1@example.com'
  s.nickname        = 'テスト太郎'
  s.first_name      = '太郎'
  s.last_name       = 'テスト'
  s.first_name_kana = 'タロウ'
  s.last_name_kana  = 'テスト'
  s.birthday        = Date.new(1986, 5, 2)
  s.password        = 'password'
end

User.seed do |s|
  s.id              = 2
  s.email           = 'test2@example.com'
  s.nickname        = 'テスト花子'
  s.first_name      = '花子'
  s.last_name       = 'テスト'
  s.first_name_kana = 'ハナコ'
  s.last_name_kana  = 'テスト'
  s.birthday        = Date.new(1986, 5, 2)
  s.password        = 'password'
end

User.seed do |s|
  s.id              = 3
  s.email           = 'test3@example.com'
  s.nickname        = 'テスト次郎'
  s.first_name      = '次郎'
  s.last_name       = 'テスト'
  s.first_name_kana = 'ジロウ'
  s.last_name_kana  = 'テスト'
  s.birthday        = Date.new(1986, 5, 2)
  s.password        = 'password'
end

User.seed do |s|
  s.id              = 4
  s.email           = 'test4@example.com'
  s.nickname        = '伊集院剛'
  s.first_name      = '剛'
  s.last_name       = '伊集院'
  s.first_name_kana = 'タケシ'
  s.last_name_kana  = 'イジュウイン'
  s.birthday        = Date.new(1986, 5, 2)
  s.password        = 'password'
end

User.seed do |s|
  s.id              = 5
  s.email           = 'test5@example.com'
  s.nickname        = '山田満'
  s.first_name      = '満'
  s.last_name       = '山田'
  s.first_name_kana = 'ミツル'
  s.last_name_kana  = 'ヤマダ'
  s.birthday        = Date.new(1986, 5, 2)
  s.password        = 'password'
end
