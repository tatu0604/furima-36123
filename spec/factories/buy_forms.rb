FactoryBot.define do
  factory :buy_form do
    postal_code   { '123-1234' }
    area_id       { 2 }
    municipality  { '横浜市' }
    address       { '青山' }
    building_name { 'ビル' }
    phone_number  { 12_345_678_901 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
