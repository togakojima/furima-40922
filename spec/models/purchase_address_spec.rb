require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)   
    item = FactoryBot.create(:item)    
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)    
  end
  describe '購入、配送先情報の保存' do

    context '内容に問題ない場合' do
      it "すべての値が正しく入力されてtokenがあれば保存できる" do
        expect(@purchase_address).to be_valid
      end
      it "building_nameが空でも保存できる" do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "postcodeが空だと保存できない" do
        @purchase_address.postcode = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it "postcodeが3桁ハイフン4桁でないと保存できない" do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "postcodeに全角が含まれていると保存できない" do
        @purchase_address.postcode = '123-４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "postcodeに数字以外が含まれていると保存できない" do
        @purchase_address.postcode = '123-abcd'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "prefecture_idが[---]だと保存できない" do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空だと保存できない" do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it "house_numが空だと保存できない" do
        @purchase_address.house_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House num can't be blank")
      end
      it "tel_numが空だと保存できない" do
        @purchase_address.tel_num = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num can't be blank")
      end
      it "tel_numが10桁未満だと保存できない" do
        @purchase_address.tel_num = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num is invalid. Enter numbers only (10~11 characters)")
      end
      it "tel_numが12桁以上だと保存できない" do
        @purchase_address.tel_num = '1234567890123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num is invalid. Enter numbers only (10~11 characters)")
      end
      it "tel_numに全角が含まれていると保存できない" do
        @purchase_address.tel_num = '123456789０１'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num is invalid. Enter numbers only (10~11 characters)")
      end
      it "tel_numに数字以外が含まれていると保存できない" do
        @purchase_address.tel_num = '12345678abc'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel num is invalid. Enter numbers only (10~11 characters)")
      end
      it "tokenが空だと保存できない" do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていないと保存できない" do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが紐付いていないと保存できない" do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

  
