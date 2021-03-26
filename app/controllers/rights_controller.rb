class RightsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
  def new
    @right = Right.new
    @post = Post.find_by(id: params[:id])
  end
  def create
    @right = Right.new(right_params)
    @right_post = @right.post
    
    @right.save
    if @right.save
      @right_post.create_notification_right!(current_user, @right.id)
      
      redirect_to post_path(@right.post)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_right_path
      flash[:alert] = "投稿に失敗しました"
    end


  end
  def destroy
    @right = Right.find_by(id: params[:id])
    @right.destroy
    if @right.destroy
      flash[:notice] = "投稿が削除されました"
      redirect_to user_path(@right.user)
    else
      flash[:alert] = "投稿の削除に失敗しました"
    end
  end
  def show
    @right = Right.find(params[:id])
    if @right.criterions.first
      @hagetako =  @right.criterions.first.created_at.strftime("%Y-%m-%d") 
      @hagetakohagetako = Date.parse(@hagetako) + @right.deadline - Date.today
      @hagetakohagetakohagetako = @hagetakohagetako.to_i
    end
  end
  
  def search
    render layout: false
  end
  def searches
    @rights = Right.where('content LIKE(?)', "%#{params[:title]}%")
    respond_to do |format|
      format.html { redirect_to :root }
      # ↓検索結果のデータをレスポンスするコード
      format.json { render json: @rights }
    end
  end 
  private
    def right_params
      params.require(:right).permit(:content, :point, :deadline, :due, :owner, images: []).merge(user_id: current_user.id, post_id: params[:right][:post_id])
    end
end
