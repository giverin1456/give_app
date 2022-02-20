require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
      @item = FactoryBot.build(:item)
    end

    describe '出品' do
      context '出品できる' do
        # it '全ての項目に適切に入力できていれば出品できる' do
        #   expect(@item).to be_valid
        # end
      end

      context '商品の出品ができない時' do
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("画像を入力してください")
        end
        it '商品名が空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "商品名を入力してください"
        end
        it '商品の説明が空ではでは登録できない' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "商品の説明を入力してください"
        end
        it 'category_idが1では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "カテゴリーを選択して下さい"
        end
        it 'status_idが1では登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "商品の状態を選択して下さい"
        end
        it 'delivery_charge_idが1では登録できない' do
          @item.delivery_charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "配送料を選択して下さい"
        end
        it 'prefecture_idが1では登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "発送する地域を選択して下さい"
        end
        it 'day_idが1では登録できない' do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "配送日を選択して下さい"
        end
        it '販売価格が空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "価格を入力してください"
        end
        it '販売価格が¥300以下であれば登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include "価格は300より大きい値にしてください"
        end
        it '販売価格が¥9,999,999以上なら登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include "価格は9999999より小さい値にしてください"
        end
        it '販売価格は半角数字でなければ登録できない' do
          @item.price = '２０００'
          @item.valid?
          expect(@item.errors.full_messages).to include "価格は数値で入力してください"
        end
        it '販売価格が半角英数混合では登録できない' do
          @item.price = '123abc'
          @item.valid?
          expect(@item.errors.full_messages).to include "価格は数値で入力してください"
        end
        it '販売価格が半角英語では登録できない' do
          @item.price = 'aaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include "価格は数値で入力してください"
        end
        # it 'userが紐付いていないと登録できない' do
        #   @item.user = nil
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include('User must exist')
        # end
       end
    end
end
