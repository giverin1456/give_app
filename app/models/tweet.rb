class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :tweet_comments, dependent: :destroy
  acts_as_likeable
  has_many :notifications, dependent: :destroy


  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and tweet_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        tweet_id: id,
        visited_id: user_id,
        action: 'like'
      )
      unless notification.visitor_id == notification.visited_id
        notification.save if notification.valid?
      end
    end
  end



  def create_notification_comment!(current_user, tweet_comment_id)
    temp_ids = TweetComment.select(:user_id).where(tweet_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, tweet_comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, tweet_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, tweet_comment_id, visited_id)
    notification = current_user.active_notifications.new(
      tweet_id: id,
      tweet_comment_id: tweet_comment_id,
      visited_id: visited_id,
      action: 'tweetcomment'
    )
    unless notification.visitor_id == notification.visited_id
      notification.save if notification.valid?
    end
  end


  

  def was_attached?
    self.image.attached?
  end

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  with_options presence: true do
    validates :text
    validates :image
  end
end
