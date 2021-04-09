class ChargesController < ApplicationController

  def create
    @support = Support.find(params[:id])
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @support.point,
      description: "応援ID:#{@support.id} 商品名:#{@support.message}",
      currency: "jpy",
    })
    P.create(user_id: current_user.id,post_id: @support.post.id, support_id: @support.id, point: @support.point, owner: @support.post.user.id)
    #rails側の売れたとき処理
    if charge
      redirect_to post_path(@support.post), notice: "応援購入しました！"
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end