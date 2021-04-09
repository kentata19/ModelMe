class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  def home
    render layout: false
  end
  def new
    @post = Post.new
    
  end
  def create
    @post = Post.new(post_params)
    @post.save
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_post_path
      flash[:alert] = "投稿に失敗しました"
    end


  end
  def index
    @posts = Post.all.order('created_at DESC').page(params[:page]).per(40)
  end
  def show
    @post = Post.find(params[:id])
    @rights = @post.rights.order('created_at DESC').page(params[:page]).per(5)
    @replies = @post.reps.order('created_at DESC')
    @supports = @post.supports.order('created_at DESC')
  end
  def search
    render layout: false
  end

  def searches
    @posts = Post.where('caption LIKE(?)', "%#{params[:title]}%")
    respond_to do |format|
      format.html { redirect_to :root }
      # ↓検索結果のデータをレスポンスするコード
      format.json { render json: @posts }
    end
  end 
  private
    def post_params
      params.require(:post).permit(:title, :caption,  images: []).merge(user_id: current_user.id)
    end
end
