require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_form = FactoryBot.build(:buy_form, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_form).to be_valid
      end
      it '建物名が空でも保存できること' do
        @buy_form.building_name = ''
        expect(@buy_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @buy_form.postal_code = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号は、「3桁ハイフン4桁」以外は保存できないこと' do
        @buy_form.postal_code = '1234567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Postal code is invalid'
      end
      it '郵便番号は、半角文字列以外は保存できないこと' do
        @buy_form.postal_code = '１２３４５６７'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Postal code is invalid'
      end
      it '都道府県が空だと保存できないこと' do
        @buy_form.area_id = 1
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Area must be other than 1'
      end
      it '市区町村が空だと保存できないこと' do
        @buy_form.municipality = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Municipality can't be blank"
      end
      it '番地が空だと保存できないこと' do
        @buy_form.address = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空だと保存できないこと' do
        @buy_form.phone_number = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号は、10桁以下は保存できないこと' do
        @buy_form.phone_number = 123_456_789
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号は、11桁以上は保存できないこと' do
        @buy_form.phone_number = 123_456_789_012
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it '電話番号は、半角数値以外は保存できないこと' do
        @buy_form.phone_number = '１２３４５６７８９０'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_form.user_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_form.item_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空では登録できないこと' do
        @buy_form.token = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
