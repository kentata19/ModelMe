class ZipChargesController < ApplicationController
  def create
    @zipfile = Zipfile.find(params[:id])
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @zipfile.right.point,
      description: "ZIPファイルID:#{@zipfile.id} 作品タイトル:#{@zipfile.right.post.title}",
      currency: "jpy",
    })
    Pz.create(user_id: current_user.id,right_id: @zipfile.right.id, zipfile_id: @zipfile.id, point: @zipfile.right.point, owner: @zipfile.right.post.user.id)
    #rails側の売れたとき処理
    if charge
      redirect_to zipfile_path(@zipfile), notice: "zipファイルをダウンロードできます"
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
