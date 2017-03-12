Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/history', to: 'home#history'

  resources :games, only: [:new, :create]
  get '/log', to: 'games#new'
end
