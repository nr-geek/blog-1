class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 5_000 }
end
