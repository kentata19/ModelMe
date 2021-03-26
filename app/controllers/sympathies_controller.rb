class SympathiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def new
    @sympathy = Sympathy.new
    @right = Right.find_by(id: params[:id])
    if @right.criterions.first
      @hagetako =  @right.criterions.first.created_at.strftime("%Y-%m-%d") 
      @hagetakohagetako = Date.parse(@hagetako) + @right.deadline - Date.today
      @hagetakohagetakohagetako = @hagetakohagetako.to_i
    end
  end
  def create
    @sympathy = Sympathy.new(sympathy_params)
    @sympathy.save
    if @sympathy.save
      redirect_to right_path(@sympathy.right)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_sympathy_path
      flash[:alert] = "投稿に失敗しました"
    end


  end
  def destroy
    @sympathy = Sympathy.find_by(id: params[:id])
    @sympathy.destroy
    if @sympathy.destroy
      flash[:notice] = "投稿が削除されました"
      redirect_to user_path(@sympathy.user)
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end
  private
    def sympathy_params
      params.require(:sympathy).permit(:point).merge(user_id: current_user.id, right_id: params[:sympathy][:right_id], post_id: params[:sympathy][:post_id])
    end
end
