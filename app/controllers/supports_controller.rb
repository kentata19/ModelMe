class SupportsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :credit]
  def new
    @support = Support.new
    
    @post = Post.find_by(id: params[:id])
  end
  def create
    @support =  Support.new(support_params)
    @support_post = @support.post
    @support.save
    if @support.save
      @support_post.create_notification_support!(current_user, @support.id)
      
      redirect_to new_spayment_path(@support)
      flash[:notice] = "お支払いに移ります ※まだ購入は確定していません"
    else
      redirect_to new_support_path
      flash[:alert] = "投稿に失敗しました"
    end
    

  end
  
  def destroy
    @support = Support.find_by(id: params[:id])
    @support.destroy
    if @support.destroy
      flash[:notice] = "投稿が削除されました"
      redirect_to user_path(@support.user)
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end
  def credit
    @support = Support.find(params[:id])
    @post = @support.post
    @supports = @post.supports.order('created_at DESC')
    
  end 
  private
    def support_params
      params.require(:support).permit(:message, :point).merge(user_id: current_user.id, post_id: params[:support][:post_id])
    end
end
