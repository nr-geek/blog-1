class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
  validates :post, presence: true

  validates :post, uniqueness: { scope: :user }

  validates :value,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
