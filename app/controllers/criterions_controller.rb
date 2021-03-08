class CriterionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def new
    @criterion = Criterion.new
    @right = Right.find_by(id: params[:id])
  end
  def create
    @criterion = Criterion.new(criterion_params)
    @criterion.save
    if @criterion.save
      redirect_to right_path(@criterion.right)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_criterion_path
      flash[:alert] = "投稿に失敗しました"
    end


  end
  def destroy
    @criterion = Criterion.find_by(id: params[:id])
    @criterion.destroy
    if @criterion.destroy
      flash[:notice] = "投稿が削除されました"
      redirect_to user_path(@criterion.user)
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end
  private
    def criterion_params
      params.require(:criterion).permit(:sp).merge(user_id: current_user.id, right_id: params[:criterion][:right_id])
    end
end
