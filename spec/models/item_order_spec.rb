require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

    describe '購入機能' do
      context '商品の購入ができる時' do
        it '全ての必須項目が入力されている時購入できる' do
          expect(@item_order).to be_valid
        end

        it 'buildingがなくても購入できる' do
          @item_order.building = nil
          expect(@item_order).to be_valid
        end

      end

      context '商品の購入ができない時' do
        it 'tokenが空では購入できない' do
          @item_order.token = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include("カード情報を入力してください")
        end

        it 'postal_codeが空では空では購入できない' do
          @item_order.postal_code = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "郵便番号を入力してください"
        end

        it '郵便情報にはハイフンがなければ購入できない' do
          @item_order.postal_code = "1234567"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "郵便番号は不正な値です"
        end

        it 'postal_codeはハイフンを入れて8文字でなければ購入できない' do
          @item_order.postal_code = "1111111"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "郵便番号は8文字で入力してください"
        end

        it 'prefecture_idが1では購入できない' do
          @item_order.prefecture_id = 1
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "都道府県を入力して下さい"
        end

        it 'cityが空では購入できない' do
          @item_order.city = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "市区町村を入力してください"
        end

        it 'streetが空では購入できない' do
          @item_order.street = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "番地を入力してください"
        end

        it 'phone_numberが空では購入できない' do
          @item_order.phone_number = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "電話番号を入力してください"
        end

        it '電話番号は11桁以内の数値のみ保存可能' do
          @item_order.phone_number = "090123456789"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "電話番号は不正な値です"
        end

        it '電話番号が半角数字のみでないと登録できない' do
          @item_order.phone_number = "０９０１２３４５６７８"
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "電話番号は不正な値です"
        end

        it 'user_idが空では購入できない' do
          @item_order.user_id = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Userを入力してください"
        end

        it 'item_idが空では購入できない' do
          @item_order.item_id = nil
          @item_order.valid?
          expect(@item_order.errors.full_messages).to include "Itemを入力してください"
        end
     end
   end
end