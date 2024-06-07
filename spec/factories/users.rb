FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'test1234' }
    password_confirmation { password }
    firstname_kanji { '太郎' }
    lastname_kanji { '山田' }
    firstname_kana { 'タロウ' }
    lastname_kana { 'ヤマダ' }
    birthday { '2000-01-01' }
  end
end
