require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end
  describe '商品購入の情報保存' do
    context '保存できる場合' do
      it 'ログイン状態の出品者以外のユーザーのみ、必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空欄でも保存できること'do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '保存できない場合' do
      it '' do
        
      end
    end
  end
end