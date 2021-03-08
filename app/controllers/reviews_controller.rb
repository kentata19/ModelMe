class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def new
    @review = Review.new
    @right = Right.find(params[:id])
  end
  def create
    @review = Review.new(review_params)
    @review.save
    if @review.save
      redirect_to reviews_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_review_path
      flash[:alert] = "投稿に失敗しました"
    end


  end
  def index
    @reviews = Review.all.order('created_at DESC')
  end
  def show
    @review = Review.find(params[:id])
  end
  private
    def review_params
      params.require(:review).permit(:caption, images: []).merge(user_id: current_user.id, post_id: params[:review][:post_id], right_id: params[:review][:right_id])
    end
end
