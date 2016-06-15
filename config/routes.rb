require 'sidekiq/web'
Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :videos
  resources :users


  get '/videos/:id/like' => 'videos#like'
  get '/videos/:id/dislike' => 'videos#dislike'

match 'login/', to: 'login#login_page', :via => [:post, :get]
match ':controller(/:action(:/id))', :via => [:post, :get]
  mount Sidekiq::Web => '/sidekiq'

  root 'videos#index'
end