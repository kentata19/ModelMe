class ReplyReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def new
    @reply_review = ReplyReview.new
    @review = Review.find_by(id: params[:id])
  end
  def create
    @reply_review =  ReplyReview.new(reply_params)
    @reply_review.save
    if @reply_review.save
      redirect_to review_path(@reply_review.review)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_reply_path
      flash[:alert] = "投稿に失敗しました"
    end

  end
  def destroy
    @reply_review = ReplyReview.find_by(id: params[:id])
    @reply_review.destroy
    if @reply_review.destroy
      flash[:notice] = "投稿が削除されました"
      redirect_to user_path(@reply_review.user)
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end
  private
    def reply_params
      params.require(:reply_review).permit(:comment).merge(user_id: current_user.id, review_id: params[:reply_review][:review_id])
    end
end
