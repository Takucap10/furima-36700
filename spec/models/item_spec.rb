require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it 'name,information,category_id,status_id,postage_id,prefecture_id,sending_day_id,price,imageが存在すると出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'nameがなければ出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'informationがなければ出品できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'category_idがなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが１では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idがなければ出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idが１では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'postage_idがなければ出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'postage_idが１では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'prefecture_idがなければ出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prifecture_idが１では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'sending_day_idがなければ出品できない' do
        @item.sending_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending day can't be blank")
      end
      it 'sending_day_idが１では出品できない' do
        @item.sending_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending day can't be blank")
      end
      it 'priceがなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが10,000,000以上では出品できない' do
        @item.price = 10_100_100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが全角数字では保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'imageがなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいてなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
