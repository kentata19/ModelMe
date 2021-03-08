class ZipfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @zipfile = Zipfile.new
    @right = Right.find(params[:id])
  end
  def create
    @zip = Zipfile.new(zipfile_params)
    @zip.save!
    
    if @zip.save!
      redirect_to zipfile_path(@zip)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_zipfile_path
      flash[:alert] = "投稿に失敗しました"
    end
  end
  def show
    @zipfile = Zipfile.find(params[:id])
    @right = @zipfile.right
  end

  private

      def zipfile_params
          params.require(:zipfile).permit(:file).merge(user_id: current_user.id, right_id: params[:zipfile][:right_id])
      end
end
