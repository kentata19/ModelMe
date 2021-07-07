Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, # ここの行にカンマを追加
    controllers: { registrations: 'registrations' } # ここの行を追加

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#home'
  #userに関するルーティング
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/sympathy', to: 'users#sympathy', as: 'user_sympathy'
  get '/users/:id/right', to: 'users#right', as: 'user_right'
  get '/users/:id/wish', to: 'users#wish', as: 'user_wish'
  get '/users/:id/support', to: 'users#support', as: 'user_support'
  #postに関するルーティング
  get '/posts/search' => 'posts#search'
  get '/posts/searches' => 'posts#searches'
  resources :posts do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    
    
  end
  
  #rightに関するルーティング
  get '/rights/search' => 'rights#search'
  get '/rights/searches' => 'rights#searches'
  resources :rights, only: %i(show index create destroy)
  get '/rights/new/:id' => 'rights#new', as: 'new_right'
  #supportsに関するルーティング
  resources :supports, only: %i(create destroy)
  get '/supports/new/:id' => 'supports#new', as: 'new_support'
  get '/supports/credit/:id' => 'supports#credit', as: 'credit_support'
  #replyに関するルーティング
  resources :reps, only: %i(create destroy)
  get '/reps/new/:id' => 'reps#new', as: 'new_rep'
  #sympathyに関するルーティング
  resources :sympathies, only: %i(create destroy)
  get '/sympathies/new/:id' => 'sympathies#new', as: 'new_sympathy'
  #criterionに関するルーティング
  resources :criterions, only: %i(create destroy)
  get '/criterions/new/:id' => 'criterions#new', as: 'new_criterion'
  #zipfileに関するルーティング
  get "zipfiles/payment_cancel" => "zipfiles#payment_cancel"
  get "zipfiles/after_payment_register" => "zipfiles#after_payment_register"
  resources :zipfiles, only: %i(show create destroy)
  get '/zipfiles/new/:id' => 'zipfiles#new', as: 'new_zipfile'
  
  #definitionに関するルーティング
  resources :definitions, only: %i(create destroy)
  get '/definitions/new/:id' => 'definitions#new', as: 'new_definition'

  #rejectionsに関するルーティング
  resources :rejections, only: %i(create destroy)
  get '/rejections/new/:id' => 'rejections#new', as: 'new_rejection'

  #reviewsに関するルーティング
  resources :reviews, only: %i(show index create destroy) do
    resources :like_reviews, only: %i(create destroy)
  end
  #reply_reviewに関するルーティング
  resources :reply_reviews, only: %i(create destroy)
  get '/reply_reviews/new/:id' => 'reply_reviews#new', as: 'new_reply_review'

  get '/reviews/new/:id' => 'reviews#new', as: 'new_review'
  #notificationに関するルーティング
  resources :notifications, only: [:index, :destroy]
  #relationshipsに関するルーティング
  resources :relationships, only: [:create, :destroy]
  #決済に関するルーティング
  
  
  
  
  #ポリシーに関するルーティング
  get '/policies/tou' => 'policies#tou', as: 'tou_policy'
  get '/policies/privacy' => 'policies#privacy', as: 'privacy_policy'
  get '/policies/transaction' => 'policies#transaction', as: 'transaction_policy'
  get '/policies/creator' => 'policies#creator', as: 'creator_policy'
  get '/policies/client' => 'policies#client', as: 'client_policy'
  
  #決済に関するルーティング
  get 'payments/new/:id' => 'payments#new', as: 'new_payment'
  get 'payments/after_payment_register' => 'payments#after_payment_register'
  get '/payments/payment_cancel' => 'payments#payment_cancel'
  get 'spayments/new/:id' => 'spayments#new', as: 'new_spayment'
  get 'spayments/after_payment_register' => 'spayments#after_payment_register'
  get '/spayments/payment_cancel' => 'spayments#payment_cancel'
end

