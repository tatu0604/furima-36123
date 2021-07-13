FactoryBot.define do
  factory :item do
    name           { 'furima太郎' }
    information    { '商品の説明です。' }
    category_id    { 2 }
    status_id      { 2 }
    shipping_id    { 2 }
    area_id        { 2 }
    days_id        { 2 }
    price          { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/Railsの処理の流れ.png'), filename: 'Railsの処理の流れ.png')
    end
  end
end
