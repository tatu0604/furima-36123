require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?  
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password には英字と数字の両方を含めて設定してください"
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password には英字と数字の両方を含めて設定してください"
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = '１２a232'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password には英字と数字の両方を含めて設定してください"
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it 'surnameが空だと保存できないこと' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname can't be blank"
      end
      it 'surnameが全角日本語でないと保存できないこと' do
        @user.surname = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname is invalid. Input full-width characters."
      end
      it 'first_nameが空だと保存できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角日本語でないと保存できないこと' do
        @user.first_name = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end
      it 'kana_surnameが空だと保存できないこと' do
        @user.kana_surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana surname can't be blank"
      end
      it 'kana_surnameが全角カタカナでないと保存できないこと' do
        @user.kana_surname = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana surname is invalid. Input full-width katakana characters."
      end
      it 'kana_first_nameが空だと保存できないこと' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end
      it 'kana_first_nameが全角カタカナでないと保存できないこと' do
        @user.kana_first_name = 'りくたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name is invalid. Input full-width katakana characters."
      end
      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end