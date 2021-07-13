class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :days
  
  with_options presence: true do
    validates :name
    validates :information
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
     validates :category_id
     validates :status_id
     validates :shipping_id
     validates :area_id
     validates :days_id
    end
    validates :price, inclusion: { in: 300..9999999 }, format: {with: /\A[0-9]+\z/}
    validates :image
  end

  belongs_to :user
  #has_one :buy
  has_one_attached :image


end