class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shop_category
  belongs_to :user
  has_many :items
  belongs_to_active_hash :prefecture

  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1, message: 'を選択して下さい'} do
    validates :shop_category_id
    validates :prefecture_id
  end
end
