class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16, minimum: 2 }
  validates :email, presence: true

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :commentable, source_type: :Post
  has_many :commented_users, through: :comments, source: :commentable, source_type: :User
  has_many :marks, dependent: :destroy
  has_many :marked_posts, through: :marks, source: :post

  before_destroy :log_before_destroy

  scope :moderators, -> { where(moderator: true) }
  scope :creators, -> { where(creator: true) }

  private

  def log_before_destroy
    Rails.logger.info "Хочу удалить пользователя #{self.id} #{self.name}"
  end
end
