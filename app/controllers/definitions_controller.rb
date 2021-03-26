class DefinitionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @definition = Definition.new
    @right = Right.find(params[:id])
    if @right.criterions.first
      @hagetako =  @right.criterions.first.created_at.strftime("%Y-%m-%d") 
      @hagetakohagetako = Date.parse(@hagetako) + @right.deadline - Date.today
      @hagetakohagetakohagetako = @hagetakohagetako.to_i
    end
  end
  def create
    @definition = Definition.new(definition_params)
    @definition.save!
    
    if @definition.save!
      redirect_to right_path(@definition.right)
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
