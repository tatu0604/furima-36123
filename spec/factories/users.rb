FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    surname               { '山田' }
    first_name            { '陸太郎' }
    kana_surname          { 'ヤマダ' }
    kana_first_name       { 'リクタロウ' }
    birthday              { '1930-01-01' }
  end
end
