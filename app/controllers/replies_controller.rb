class RepliesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def new
    @reply = Rep.new
    @post = Post.find_by(id: params[:id])
  end
  def create
    @reply =  Rep.new(reply_params)
    @reply_post = @reply.post
    @reply.save
    if @reply.save
      #通知の作成
      @reply_post.create_notification_reply!(current_user, @reply.id)
      
      redirect_to post_path(@reply.post)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_reply_path
      flash[:alert] = "投稿に失敗しました"
    end

  end
  def destroy
    @reply = Rep.find_by(id: params[:id])
    @reply.destroy
    if @reply.destroy
      flash[:notice] = "投稿が削除されました"
      redirect_to user_path(@reply.user)
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end
  private
    def reply_params
      params.require(:rep).permit(:caption).merge(user_id: current_user.id, post_id: params[:reply][:post_id])
    end
end
