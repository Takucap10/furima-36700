require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

    context '商品を購入できる場合' do
      it 'post_code,prefecture_id,city,block,phone_number,tokenが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingがなくても登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it '電話番号が11桁でも登録できる' do
        @order_address.phone_number = '09012345678'
      expect(@order_address).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが数字だけでは登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows(123-4567)")

      end
      it 'prefecture_idが空では登録できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが１では登録できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では登録できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに"-"が入ると登録できない' do
        @order_address.phone_number = '060-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが10桁未満だと登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum length 10)")
      end
      it 'tokenが空では登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end