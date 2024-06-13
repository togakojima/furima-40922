FactoryBot.define do
  factory :purchase_address do
    postcode { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '岐阜市' }
    house_num { '1-1' }
    building_name { 'テックマンション101'}
    tel_num { '12345678901'}
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
