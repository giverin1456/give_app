class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments
  has_many :tweets
  has_many :tweet_comments
  has_one_attached :image
  acts_as_liker
  has_one :shop

  validates :nickname, presence: true, unless: :was_attached?

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