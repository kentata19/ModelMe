class DefinitionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @definition = Definition.new
    @right = Right.find(params[:id])
  end
  def create
    @definition = Definition.new(definition_params)
    @definition.save!
    
    if @definition.save!
      redirect_to root_path
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_definition_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  private

    def definition_params
      params.require(:definition).permit().merge(user_id: current_user.id, right_id: params[:definition][:right_id])
    end
end
