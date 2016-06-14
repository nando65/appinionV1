require 'sidekiq/web'
Rails.application.routes.draw do

  root 'videos#index'
  resources :videos

  get '/videos/:id/like' => 'videos#like'
  get '/videos/:id/dislike' => 'videos#dislike'

  devise_for :users

  resources :users

match ':controller(/:action(:/id))', :via => [:post, :get]
  mount Sidekiq::Web => '/sidekiq'
end