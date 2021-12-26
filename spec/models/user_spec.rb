require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'emailとpassword、name,first_name,last_name,first_name_kane,last_name_kana,birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
end
