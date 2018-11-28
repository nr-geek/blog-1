class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user

  has_many :marks, dependent: :destroy
  has_many :marked_users, through: :marks, source: :mark

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 5_000 }

  scope :by_moderators, -> { joins(:user).where(users: { moderator: true }) }
end
