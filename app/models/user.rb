class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :commentable, source_type: :Post
  has_many :commented_users, through: :comments, source: :commentable, source_type: :User
  has_many :marks, dependent: :destroy
  has_many :marked_posts, through: :marks, source: :post
  has_one :seo, as: :seoable

  scope :moderators, -> { where(moderator: true) }
  scope :creators, -> { where(creator: true) }

  validates :name, presence: true, length: { maximum: 16, minimum: 2 }
  validates :email, presence: true

  before_destroy :log_before_destroy

  private

  def log_before_destroy
    Rails.logger.info "Хочу удалить пользователя #{self.id} #{self.name}"
  end
end
