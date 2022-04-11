class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to :user
  belongs_to :shop, optional: true

  has_one :order
  has_many :comments, dependent: :destroy
  acts_as_likeable

  has_many :notifications, dependent: :destroy


  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and tweet_id = ? and action = ? ", current_user.id, user_id, id, 'itemlike'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        item_id: id,
        visited_id: user_id,
        action: 'itemlike'
      )
      unless notification.visitor_id == notification.visited_id
      notification.save if notification.valid?
      end
    end
  end


  def create_notification_comment!(current_user, comment_id, item_id)
    # item = Item.where(item_id: item.id)
    temp_ids = Comment.select(:user_id).where(item_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'], item_id)
    end
    save_notification_comment!(current_user, comment_id, user_id, item_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id, item_id)
    # taiki = Item.left_joins(:notifications).where(items: {item_id: item_id}).select("user_id")
    # visitor = current_user.id
    # if visitor == taiki
    notification = current_user.active_notifications.new(
      item_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
  #   else
  #   notification = current_user.active_notifications.new(
  #     item_id: id,
  #     comment_id: comment_id,
  #     visited_id: visited_id,
  #     action: 'usercomment'
  #   )
  # end

    unless notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
    end

  end

  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :text
    validates :name
    validates :image

   with_options numericality: { other_than: 1, message: 'を選択して下さい' } do
    validates :category_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :day_id
   end
   with_options format: {with: /\A[0-9]+\z/} do
    validates :price, numericality: { 
      greater_than: 300, less_than: 9999999
       }
   end
 end
end
