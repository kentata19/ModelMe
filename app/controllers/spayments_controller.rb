class SpaymentsController < ApplicationController
  def new
    @support = Support.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      
      line_items: [{
        price_data: {
          currency: 'jpy',
          
          product_data: {
            name: @support.message,
            
          },
          unit_amount: @support.point,
          
        },
        quantity: 1,
        
      }],
      mode: 'payment',
      success_url: request.base_url + '/spayments/after_payment_register?session_id={CHECKOUT_SESSION_ID}',  # 決済成功後の遷移先
      cancel_url: request.base_url + '/spayments/payment_cancel',  #決済キャンセルした際の遷移先
    })   
  end


  #決済前のキャンセルのアクション
  def payment_cancel
  end
  def after_payment_register
    
    
    stripe_plan_data = Stripe::Checkout::Session.list_line_items(params[:session_id])  
    @support  = Support.find_by(message: stripe_plan_data[:data][0]["description"])
    @post = @support.post
    
    @point = @support.point
    @owner = @post.user
    if Csupport.find_by(user_id: current_user.id, support_id: @support.id).nil?
      Csupport.create(user_id: current_user.id, post_id: @post.id, support_id: @support.id, point: @point, owner: @owner.id)
    end
  end
end
