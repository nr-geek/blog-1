class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 16, minimum: 2 }
  validates :email, presence: true

  has_many :comments
  has_many :posts
end
