class Comment < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :commentable, polymorphic: true

  validates :user, presence: true
  validates :commentable, presence: true
  validates :body, presence: true, length: { maximum: 500 }
end
