require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '保存できる場合' do
      it 'すべての値を正しく入力した場合、保存できること' do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end
      it '商品の状態についての情報が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status を選択してください")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee を選択してください")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture を選択してください")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day を選択してください")
      end
      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること(300より小さい値)' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price の範囲外です')
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること(9,999,999より大きい値)' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price の範囲外です')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price の範囲外です')
      end
    end
  end
end
