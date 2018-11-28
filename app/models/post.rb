class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commentators, through: :comments, source: :user
  has_many :marks, dependent: :destroy
  has_many :marked_users, through: :marks, source: :mark
  has_one :seo, as: :seoable

  scope :by_moderators, -> { joins(:user).where(users: { moderator: true }) }

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 5_000 }
end
