require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'STORY投稿' do
    context 'STORY投稿できる' do
      it '全ての項目に適切に入寮できていれば出品できる' do
      end
    end

    context 'STORY投稿できない' do
      it 'textが空なら投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("テキストを入力してください")
      end

      it 'imageが空なら投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end
