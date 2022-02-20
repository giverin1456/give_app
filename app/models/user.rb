class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments
  has_many :tweets, dependent: :destroy
  has_many :tweet_comments
  has_one_attached :image
  acts_as_liker
  acts_as_follower
  acts_as_followable
  has_one :shop, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :room_users, dependent: :destroy

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


  validates :nickname, presence: true, unless: :was_attached?


  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end


  def was_attached?
    self.image.attached?
  end

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A([ぁ-んァ-ン一-龥々]|ー)+\z/} do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/} do
      validates :first_kana
      validates :last_kana
    end
    
     validates :birthday
  end

  validates :password, length: { minimum: 6 }, on: :create
  # validates :password_confirmation, presence: true, on: :create

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください',on: :create
end