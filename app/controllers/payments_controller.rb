class PaymentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :payment_cancel, :after_payment_register]
  def new
    @right = Right.find(params[:id])
    @zipfile = @right.zipfiles.first
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      
      line_items: [{
        price_data: {
          currency: 'jpy',
          
          product_data: {
            name: @right.content,
            
          },
          unit_amount: @right.point,
          
        },
        quantity: 1,
        
      }],
      mode: 'payment',
      success_url: request.base_url + '/payments/after_payment_register?session_id={CHECKOUT_SESSION_ID}',  # 決済成功後の遷移先
      cancel_url: request.base_url + '/payments/payment_cancel',  #決済キャンセルした際の遷移先
    })   
  end


  #決済前のキャンセルのアクション
  def payment_cancel
  end
  def after_payment_register
    
    
    stripe_plan_data = Stripe::Checkout::Session.list_line_items(params[:session_id])  
    @right  = Right.find_by(content: stripe_plan_data[:data][0]["description"])
    @zipfile = @right.zipfiles.first
    @owner = @right.post.user.id
    @point = @right.point
    if Pz.find_by(user_id: current_user.id, zipfile_id: @zipfile.id).nil?
      Pz.create(user_id: current_user.id,right_id: @right.id, zipfile_id: @right.zipfiles.first.id, point: @right.point, owner: @right.post.user.id)
    end
  end
end
