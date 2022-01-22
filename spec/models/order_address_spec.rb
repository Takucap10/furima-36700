require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id = user.id, item_id =item.id)
  end

  describe '商品購入機能' do
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
  end
end