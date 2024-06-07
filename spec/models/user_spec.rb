require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'nicknameが空だと保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在すると保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと保存できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordは5文字以下だと保存できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致だと保存できない' do
        @user.password = 'test12'
        @user.password_confirmation = 'test123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'firstname_kanjiが空だと保存できない' do
        @user.firstname_kanji = ''
        @user.valid?       
        expect(@user.errors.full_messages).to include "Firstname kanji can't be blank", "Firstname kanji is invalid. Input full-width character."
      end
      it 'firstname_kanjiに半角が含まれていると保存できない' do
        @user.firstname_kanji = 'taro'
        @user.valid?       
        expect(@user.errors.full_messages).to include ("Firstname kanji is invalid. Input full-width character.")
      end
      it 'lastname_kanjiが空だと保存できない' do
        @user.lastname_kanji = ''
        @user.valid?       
        expect(@user.errors.full_messages).to include "Lastname kanji can't be blank", "Lastname kanji is invalid. Input full-width character."
      end
      it 'lastname_kanjiに半角が含まれていると保存できない' do
        @user.lastname_kanji = 'yamada'
        @user.valid?       
        expect(@user.errors.full_messages).to include ("Lastname kanji is invalid. Input full-width character.")
      end
      it 'firstname_kanaが空だと保存できない' do
        @user.firstname_kana = ''
        @user.valid?       
        expect(@user.errors.full_messages).to include "Firstname kana can't be blank", "Firstname kana is invalid. Input full-width katakana characters."
      end
      it 'firstname_kanaに半角が含まれていると保存できない' do
        @user.firstname_kana = 'taro'
        @user.valid?       
        expect(@user.errors.full_messages).to include "Firstname kana is invalid. Input full-width katakana characters."
      end
      it 'firstname_kanaに漢字が含まれていると保存できない' do
        @user.firstname_kana = '太郎'
        @user.valid?       
        expect(@user.errors.full_messages).to include "Firstname kana is invalid. Input full-width katakana characters."
      end
      it 'lastname_kanaが空だと保存できない' do
        @user.lastname_kana = ''
        @user.valid?       
        expect(@user.errors.full_messages).to include "Lastname kana can't be blank", "Lastname kana is invalid. Input full-width katakana characters."
      end
      it 'lastname_kanaに半角が含まれていると保存できない' do
        @user.lastname_kana = 'yamada'
        @user.valid?       
        expect(@user.errors.full_messages).to include "Lastname kana is invalid. Input full-width katakana characters."
      end
      it 'lastname_kanaに漢字が含まれていると保存できない' do
        @user.lastname_kana = '山田'
        @user.valid?       
        expect(@user.errors.full_messages).to include "Lastname kana is invalid. Input full-width katakana characters."
      end
      it 'birthdayが空だと保存できない' do
        @user.birthday = ''
        @user.valid?       
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
