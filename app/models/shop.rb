class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shop_category
  belongs_to :user
  has_many :items

  
end
