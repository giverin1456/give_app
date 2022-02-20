require 'rails_helper'

RSpec.describe Shop, type: :model do
  before do
    @shop = FactoryBot.build(:shop)
  end

  describe 'SHOP投稿' do
    context 'SHOPを作成できる' do
      it '全ての項目に適切に入寮できていれば出品できる' do
      end
    end

    context 'SHOPを作成できない' do
      it 'nameが空なら投稿できない' do
        @shop.name = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("SHOP名を入力してください")
      end

      it 'imageが空なら作成できない' do
        @shop.image = nil
        @shop.valid?
        expect(@shop.errors.full_messages).to include("SHOPイメージを入力してください")
      end

      it 'textが空なら作成できない' do
        @shop.text = ''
        @shop.valid?
        expect(@shop.errors.full_messages).to include("SHOPストーリーを入力してください")
      end

      it 'shop_category_idが1なら作成できない' do
        @shop.shop_category_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include("出品カテゴリーを選択して下さい")
      end

      it 'prefecture_idが1なら作成できない' do
        @shop.prefecture_id = 1
        @shop.valid?
        expect(@shop.errors.full_messages).to include("都道府県を選択して下さい")
      end
    end
  end
end