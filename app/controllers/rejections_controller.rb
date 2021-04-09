class RejectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @rejection = Rejection.new
    @right = Right.find(params[:id])
    if @right.criterions.first
      @hagetako =  @right.criterions.first.created_at.strftime("%Y-%m-%d") 
      @hagetakohagetako = Date.parse(@hagetako) + @right.deadline - Date.today
      @hagetakohagetakohagetako = @hagetakohagetako.to_i
    end
  end 
  def create
    @rejection = Rejection.new(rejection_params)
    @rejection.save!
    params[:genre].each do | di1,di2 |
      if di2 == "1"
        @rr = Rr.new(
          rejection_id: @rejection.id,
          reason_id: di1
        )
        @rr.save!
      end
    end 
    if @rejection.save!
      redirect_to right_path(@rejection.right)
      flash[:notice] = "投稿が保存されました"
    else
      redirect_to new_rejection_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  private

    def rejection_params
      params.require(:rejection).permit().merge(user_id: current_user.id, right_id: params[:rejection][:right_id])
    end
end
