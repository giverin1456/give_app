class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :tweet_comments

  validates :text, presence: true, unless: :was_attached?

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
end
