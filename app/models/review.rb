class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :right
  validates :caption, presence: true, length: { maximum: 150 }
  has_many_attached :images
end
