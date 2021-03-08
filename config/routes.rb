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
  #postに関するルーティング
  resources :posts do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
  end
  #rightに関するルーティング
  resources :rights, only: %i(show create destroy)
  get '/rights/new/:id' => 'rights#new', as: 'new_right'
  #supportsに関するルーティング
  resources :supports, only: %i(create destroy)
  get '/supports/new/:id' => 'supports#new', as: 'new_support'
  #replyに関するルーティング
  resources :replies, only: %i(create destroy)
  get '/replies/new/:id' => 'replies#new', as: 'new_reply'
  #sympathyに関するルーティング
  resources :sympathies, only: %i(create destroy)
  get '/sympathies/new/:id' => 'sympathies#new', as: 'new_sympathy'
  #criterionに関するルーティング
  resources :criterions, only: %i(create destroy)
  get '/criterions/new/:id' => 'criterions#new', as: 'new_criterion'
  #zipfileに関するルーティング
  resources :zipfiles, only: %i(show create destroy)
  get '/zipfiles/new/:id' => 'zipfiles#new', as: 'new_zipfile'
  #definitionに関するルーティング
  resources :definitions, only: %i(create destroy)
  get '/definitions/new/:id' => 'definitions#new', as: 'new_definition'
  #reviewsに関するルーティング
  resources :reviews, only: %i(show index create destroy)
  get '/reviews/new/:id' => 'reviews#new', as: 'new_review'
  #notificationに関するルーティング
  resources :notifications, only: [:index, :destroy]
  #relationshipsに関するルーティング
  resources :relationships, only: [:create, :destroy]
end
