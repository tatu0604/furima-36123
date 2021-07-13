require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品ページ入力' do
    context '出品できるとき' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'nameが空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'informationが空だと保存できないこと' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Information can't be blank"
      end
      it 'category_idが空だと保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが未選択（id=1)だと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idが空だと保存できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'status_idが未選択（id=1)だと保存できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'shipping_idが空だと保存できないこと' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping can't be blank"
      end
      it 'shipping_idが未選択（id=1)だと保存できないこと' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping can't be blank"
      end
      it 'area_idが空だと保存できないこと' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idが未選択（id=1)だと保存できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'days_idが空だと保存できないこと' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days can't be blank"
      end
      it 'days_idが未選択（id=1)だと保存できないこと' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days can't be blank"
      end
      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '¥299以下は保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '¥10,000,000以上は保存できないこと' do
        @item.price = 100,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it 'priceは半角数値以外では登録できないこと' do
        @item.price = '１２a'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it 'iamgeが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
