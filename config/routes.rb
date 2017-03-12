Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :games, only: [:new, :create]
  get '/log', to: 'games#new'

  resource :history, only: :show
end
