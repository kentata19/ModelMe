class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :right
  validates :caption, presence: true, length: { maximum: 150 }
  has_many_attached :images
  has_many :like_reviews, dependent: :destroy
  def liked_by(user)
    # user_idとpost_idが一致するlikeを検索する
    LikeReview.find_by(user_id: user.id, review_id: id)
  end

  has_many :reply_reviews, dependent: :destroy
end
