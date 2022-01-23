FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    city { Gimei.address.city.kanji }
    block { Gimei.address.town.kanji }
    building { Faker::Mountain.name }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    token { 'tok_abcde12345' }
  end
end
