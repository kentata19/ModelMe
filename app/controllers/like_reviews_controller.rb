class LikeReviewsController < ApplicationController
  before_action :authenticate_user!
  def create
    @like_review = current_user.like_reviews.build(like_params)
    @review = @like_review.review
    if @like_review.save
      respond_to :js
    end
  end
  def destroy
    @like_review = LikeReview.find_by(id: params[:id])
    @review = @like_review.review
    if @like_review.destroy
      respond_to :js
    end
  end
  private
    def like_params
      params.permit(:review_id)
    end
end
