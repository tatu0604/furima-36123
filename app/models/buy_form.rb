class BuyForm
  include ActiveModel::Model
 
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :buy_id, :token

  with_options presence: true do
   validates :user_id
   validates :item_id
   validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
   validates :area_id, numericality: { other_than: 1 }
   validates :municipality
   validates :address
   validates :phone_number, format: {with: /\A\d{10,11}\z/}
   validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end

end
