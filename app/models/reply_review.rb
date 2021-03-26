class ReplyReview < ApplicationRecord
  belongs_to :user
  belongs_to :review
  validates :comment, presence: true, length: { maximum: 150 }
end
