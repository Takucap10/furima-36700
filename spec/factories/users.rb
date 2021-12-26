FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6, mix_case: false)
    password {password}
    password_confirmation {password}
    name {Faker::Name.last_name}
    first_name {Gimei.first.kanji}
    last_name {Gimei.last.kanji}
    first_name_kana {Gimei.first.katakana}
    last_name_kana {Gimei.last.katakana}
    birth_day {Faker::Date.in_date_period}
  end
end
